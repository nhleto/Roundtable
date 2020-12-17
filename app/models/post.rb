class Post < ApplicationRecord
  has_many_attached :images
  validates :body, presence: { message: 'Body cannot be blank' }
  validates_length_of :images, maximum: 3, message: 'No more than three images per post'

  belongs_to :user
  belongs_to :group, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  scope :nil_group, -> { where(group_id: nil).order('created_at DESC') }
end

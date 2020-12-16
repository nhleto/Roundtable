class Post < ApplicationRecord
  has_many_attached :images
  validates :body, presence: true
  validates_length_of :images, maximum: 3, message: 'No more than three images per post'

  belongs_to :user
  belongs_to :group, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
end

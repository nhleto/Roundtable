class Post < ApplicationRecord
  has_many_attached :images
  validates :body, presence: true

  belongs_to :user
  belongs_to :group, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
end

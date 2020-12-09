class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
end

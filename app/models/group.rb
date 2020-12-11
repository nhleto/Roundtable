class Group < ApplicationRecord
  has_one_attached :group_photo

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  belongs_to :owner, class_name: 'User'
  has_many :posts
end

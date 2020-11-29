class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_ancestry
  has_many :likes, as: :likeable

  default_scope { order('created_at DESC') }
end

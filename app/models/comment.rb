class Comment < ApplicationRecord
  default_scope { order('created_at DESC') }

  belongs_to :post
  belongs_to :user
  has_ancestry
end

class Comment < ApplicationRecord
  # scope :is_desc, -> { order('created_at DESC') }
  # scope :is_child, -> { where('parent_id IS NOT NULL') }
  # scope :is_asc, -> { order('created_at') }

  belongs_to :post
  belongs_to :user
  has_ancestry
end

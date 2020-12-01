class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  validates :user_id, presence: true,
                      uniqueness: { scope: %i[likeable_id likeable_type], message: 'item is already in favorites list.' }

  def find_parent(like)
    if like.likeable_type == 'Post'
      Post.find(like.likeable_id)
    elsif like.likeable_type == 'Comment'
      Comment.find(like.likeable_id)
    end
  end
end

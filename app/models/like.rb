class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  def find_parent(like)
    if like.likeable_type == 'Post'
      Post.find(like.likeable_id)
    elsif like.likeable_type == 'Comment'
      Comment.find(like.likeable_id)
    end
  end
end

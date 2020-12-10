class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :group, message: 'You are already a member of this group' }
end

class Membership < ApplicationRecord
  belongs_to :group, dependent: :destroy
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true
end

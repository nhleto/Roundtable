class Friendship < ApplicationRecord
  belongs_to :person, foreign_key: 'person_id', class_name: 'User'
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'User'
end

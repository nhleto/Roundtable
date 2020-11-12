class User < ApplicationRecord
  has_many :posts

  has_many :friend_requests_as_requestor, foreign_key: 'requestor_id', class_name: 'friend_request'
  has_many :friend_requests_as_receiver, foreign_key: 'receiver_id', class_name: 'friend_request'
end

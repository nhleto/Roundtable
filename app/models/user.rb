class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :friendships, foreign_key: 'person_id', class_name: 'Friendship'
  has_many :friends, through: :friendships

  def send_friend_request(user)
    friends << user
    user.friends << self
  end
end

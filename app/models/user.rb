class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :avatar, styles: {
    thumb: ['100x100#', :jpg, quality: 70],
    preview: ['480x480#', :jpg, quality: 70],
    large: ['600>', :jpg, quality: 70],
    retina: ['1200>', :jpg, quality: 30]
  }

  validates_attachment_content_type :avatar, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'application/pdf']

  has_many :posts

  has_many :friendships, foreign_key: 'person_id', class_name: 'Friendship'
  has_many :friends, through: :friendships

  def send_friend_request(user)
    friends << user
    user.friends << self
  end
end

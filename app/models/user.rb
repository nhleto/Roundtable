class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2]

  has_one_attached :avatar
  before_save :grab_image

  validates :name, presence: true
  validates :email, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :memberships
  has_many :groups, through: :memberships, dependent: :destroy
  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id'

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :received_friends, through: :received_friendships, source: 'user'

  def grab_image
    unless avatar_url.nil?
      downloaded_image = open(avatar_url)
      avatar.attach(io: downloaded_image, filename: avatar_url.to_s)
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.date_of_birth = auth.info.user_birthday
      user.avatar_url = auth.info.image # assuming the user model has an image
      # byebug
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def active_friends
    friends.select { |friend| friend.friends.include?(self) }
  end

  def pending_friends
    friends.reject { |friend| friend.friends.include?(self) }
  end
end

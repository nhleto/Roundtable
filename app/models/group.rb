class Group < ApplicationRecord
  has_one_attached :group_photo
  after_commit :add_default_photo, on: %i[create update]

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  belongs_to :owner, class_name: 'User'
  has_many :posts
  validates :name, presence: true, length: { maximum: 50, message: 'Group name maximum 50 characters' }

  private

  def add_default_photo
    unless group_photo.attached?
      group_photo.attach(io: File.open('app/assets/images/groups-placeholder.png'), filename: 'groups-placeholder.png', content_type: 'image/png')
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships,class_name: "Relationship",foreign_key: :follower_id,dependent: :destroy
  has_many :followings,through: :relationships,source: :followed

  has_many :reverse_relationships,class_name: "Relationship",foreign_key: :followed_id,dependent: :destroy
  has_many :followers,through: :reverse_relationships,source: :follower

  has_many :user_rooms,dependent: :destroy
  has_many :rooms,through: :user_rooms
  has_many :chats,dependent: :destroy
  has_many :posts,dependent: :destroy
  has_many :group_users,dependent: :destroy
  has_many :rooms,through: :group_users

  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     profile_image.variant(resize_to_limit: [width,height]).processed
  end

  GUEST_USER_EMAIL="guest@example.com"
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.name="guestname"
      user.password=SecureRandom.urlsafe_base64
      user.introduction="ゲストです"
    end
  end

  def guest_user?
    email==GUEST_USER_EMAIL
  end

  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end



end

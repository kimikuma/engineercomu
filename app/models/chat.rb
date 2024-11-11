class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications,as: :notifiable,dependent: :destroy

  validates :message,presence: true

  # after_create do
  #   notifications.create(user_id: chat.user_id)
  # end
end

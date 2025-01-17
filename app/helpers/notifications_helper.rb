module NotificationsHelper

  def notification_message(notification)
    case notification.notifiable_type
    when "Favorite"
      "#{notification.notifiable.user.name}さんが#{notification.notifiable.post.content}にいいねしました"
    end
  end
end

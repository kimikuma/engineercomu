module NotificationsHelper

def notification_message(notification)
  case notification.notifiable_type
  when "Favorite"
    "#{notification.notifiable.user.name}さんが#{notification.notifiable}にいいねしました"
  when "Chat"
    "#{notification.notifiable.user.name}さんがmessageそうしんしました"
  end
end
end

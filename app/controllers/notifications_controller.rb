class NotificationsController < ApplicationController

  def update
    notification=current_user.notifications.find(params[:id])
    notification.update(read: true)
    case notification.notifiable_type
    when "Favorite"
      redirect_to user_path(notification.notifiable.user)
    when "Chat"
      redirect_to chat_path(notification.notifiable)
    end
  end

end

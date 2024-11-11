class GroupChatsController < ApplicationController
   before_action :group_member,only: [:show]


  def show
    @group=Group.find(params[:group_id])
    @chats=@group.group_chats
    @chat=GroupChat.new(group_id: @group.id)
  end
  

  def create
    @chat=current_user.group_chats.new(chat_params)
    @chat.save
    redirect_to request.referer
  end

  def destroy
    @chat=current_user.group_chats.find(params[:id])
    @chat.destroy
    redirect_to request.referer
  end

  private
   def chat_params
     params.require(:group_chat).permit(:message, :group_id)
   end

   def group_member
     @group=Group.find(params[:group_id])
      unless @group.includesUser?(current_user)
        redirect_to groups_path
      end
   end


end

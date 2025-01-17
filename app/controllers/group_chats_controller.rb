class GroupChatsController < ApplicationController
   before_action :group_member,only: [:show]


  def index
    @group=Group.find(params[:group_id])
    @chats=@group.group_chats
    @group_chat=current_user.group_chats.new
  end
  

  def create
    @group=Group.find(params[:group_id])
    @group_chat=current_user.group_chats.new(chat_params)
    @group_chat.save
  end

  def destroy
    @group_chat=current_user.group_chats.find(params[:id])
    @group_chat.destroy
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

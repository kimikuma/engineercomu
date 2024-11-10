class GroupUsersController < ApplicationController

  def create
    groupuser=current_user.group_users.new(group_id: params[:group_id])
    redirect_to request.referer
  end

  def destroy
    groupuser=current_user.group_users.find_by(group_id: params[:group_id])
    groupuser.destroy
    redirect_to request.referer
  end

end

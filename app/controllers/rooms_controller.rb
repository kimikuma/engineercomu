class RoomsController < ApplicationController
  def index
    @rooms=current_user.rooms.all
  end
end

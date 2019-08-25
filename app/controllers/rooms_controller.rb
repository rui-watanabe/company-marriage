class RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.create
    redirect_to "/rooms/#{@room.id}"
  end

  
end

class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id, status: 0).page(params[:page]).per(5).order("created_at DESC")
  end
  
end

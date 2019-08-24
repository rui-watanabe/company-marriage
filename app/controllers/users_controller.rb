class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.where.not(id: current_user.id, status: 0).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
  
end

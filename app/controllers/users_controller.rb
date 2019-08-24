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

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end


  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

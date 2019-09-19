class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:follow, :unfollow, :follow_list, :follower_list, :matching_list, :release, :nonrelease]

  def index
    @users = User.where.not(id: current_user.id, status: 0).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
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
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end


  def follow_list
  end

  def follower_list
  end

  def matching_list
    (current_user.followed_by? @user) && (@user.followed_by? current_user)
  end

  def release
    @user.released! unless @user.released?
    flash[:notice]= 'このアカウントを公開しました'
    redirect_to  "/users/#{@user.id}"
  end

  def nonrelease
    @user.nonreleased! unless @user.nonreleased?
    flash[:notice]= 'このアカウントを非公開にしました'
    redirect_to "/users/#{@user.id}"
  end
  
  private

  def set_user
    @user =  User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :profile)
  end
end

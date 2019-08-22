class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    flash[:notice] = "投稿しました"
    redirect_to root_path
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
  
  private
  def tweet_params
    params.permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

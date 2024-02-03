class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_notes = @user.notes.order(created_at: :desc)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  def follows
    @user = User.find(params[:id])
    @follows = @user.followings
  end
end

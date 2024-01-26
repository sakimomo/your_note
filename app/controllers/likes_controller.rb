class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = current_user.likes.includes(:note)
  end

  def create
    like = current_user.likes.build(note_id: params[:note_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = current_user.likes.find_by(note_id: params[:note_id])
    like.destroy
    respond_to do |format|
      format.js
    end
  end
end

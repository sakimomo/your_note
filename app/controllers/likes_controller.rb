class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = current_user.likes.includes(:note)
  end

  def create
    like = current_user.likes.build(note_id: params[:note_id])
    like.save
    render partial: 'likes/like', locals: { note: like.note }
  end

  def destroy
    like = current_user.likes.find_by(note_id: params[:note_id])
    note = like.note
    like.destroy
    render partial: 'likes/like', locals: { note: note }
  end
end

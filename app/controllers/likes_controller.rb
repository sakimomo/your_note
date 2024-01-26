class LikesController < ApplicationController
  before_action :set_note

  def create
    like = current_user.likes.build(note_id: params[:note_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(note_id: params[:note_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_note
    @note = Note.find(params[:note_id])
  end
end

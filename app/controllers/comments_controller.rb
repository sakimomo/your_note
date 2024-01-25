class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to note_path(@comment.note)
    else
      render 'notes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, note_id: params[:note_id])
  end
end

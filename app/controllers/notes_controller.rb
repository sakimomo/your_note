class NotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update]
  before_action :set_note, only: [:show, :edit, :update, :destroy]


  def index
    @notes = Note.order(created_at: :desc).all
  end

  def new
    @note_form = NoteForm.new
  end

  def create
    @note_form = NoteForm.new(note_form_params)
    if @note_form.valid? 
       @note_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @note.comments.includes(:user)
  end

  def edit
    return unless @note.nil? || current_user.id != @note.user_id
  
    note_attributes = @note.attributes
    @note_form = NoteForm.new(note_attributes)
  
    redirect_to root_path
  end

  def update
    @note_form = NoteForm.new(note_form_params)
    @note_form.image ||= @note.image.blob
    if @note_form.valid?
      @note.update(note_form_params)
      redirect_to note_path
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  #def note_params
    #params.require(:note).permit(:content, :image, :genre_id).merge(user_id: current_user.id)
  #end
  def set_note
    @note = Note.find(params[:id])
  end

  def note_form_params
    params.require(:note_form).permit(:content, :tag_name, :image, :genre_id).merge(user_id: current_user.id)
  end
end

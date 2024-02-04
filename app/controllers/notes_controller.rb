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
    if @note.nil? || current_user.id != @note.user_id
      redirect_to root_path
      return
    end
  
    note_attributes = @note.attributes
    @note_form = NoteForm.new(note_attributes)
    @note_form.tag_name = @note.tags.first&.tag_name
  end

  def update
    @note_form = NoteForm.new(note_form_params)
    @note_form.id = @note.id 
    @note_form.image ||= @note.image.blob
    if @note_form.valid?
      @note_form.update(note_form_params, @note)
      redirect_to note_path
    else
      render :edit
    end
  end

  def destroy
    @note.note_tag_relations.destroy_all 
    @note.destroy
    redirect_to root_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_form_params
    params.require(:note_form).permit(:content, :tag_name, :image, :genre_id).merge(user_id: current_user.id)
  end
end

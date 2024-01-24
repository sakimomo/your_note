class NotesController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :authenticate_user!

  def index
    @notes = Note.all 
    @notes = Note.order(created_at: :desc)
  end

  def new
   @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])

  end

  def edit
    @note = Note.find_by(id: params[:id])

    if @note.nil? || current_user.id != @note.user_id
      redirect_to root_path
    end
  end

  def update
    note = Note.find(params[:id])
    if note.update(note_params)
      redirect_to note_path
    else
      render :edit
    end
  end

  
  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def note_params
    params.require(:note).permit(:content, :image).merge(user_id: current_user.id)
  end
end

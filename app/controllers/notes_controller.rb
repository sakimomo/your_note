class NotesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create,:destroy,:update]

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

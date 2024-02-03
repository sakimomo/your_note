class NoteForm
  include ActiveModel::Model
  attr_accessor :content, :image, :genre_id, :user_id, :id, :created_at, :updated_at, :tag_name

  with_options presence: true do
    validates :content
    validates :image
    validates :user_id
    validates :tag_name
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  end

  def save
    return false if invalid?
  
    note = Note.create(content: content, tag_name: tag_name, image: image, genre_id: genre_id, user_id: user_id)
    if note.persisted? && tag_name.present? && !tag_name.empty?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      NoteTagRelation.create(note_id: note.id, tag_id: tag.id)
    end
  end

  def update(params, note)
    note.update(params)
  end

end
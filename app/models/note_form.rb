class NoteForm
  include ActiveModel::Model
  attr_accessor :content, :image, :genre_id, :user_id, :id, :created_at, :updated_at, :tag_name

  with_options presence: true do
    validates :content
    validates :image
    validates :user_id
    validates :tag_name
    validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    return false if invalid?

    note = Note.create(content:, image:, genre_id:, user_id:)
    return unless note.persisted? && tag_name.present? && !tag_name.empty?

    tag = Tag.where(tag_name:).first_or_initialize
    tag.save
    NoteTagRelation.create(note_id: note.id, tag_id: tag.id)
  end

  def update(attr, note_obj)
    note = Note.find(note_obj.id)
    tag = Tag.find_or_initialize_by(tag_name:)

    tag.save if tag_name.present?

    note.update(attr)

    return unless tag_name.present?

    note.note_tag_relations.destroy_all
    NoteTagRelation.create(note_id: note.id, tag_id: tag.id)
  end
end

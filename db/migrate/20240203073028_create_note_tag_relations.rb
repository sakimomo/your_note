class CreateNoteTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :note_tag_relations do |t|
      t.references :note, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end

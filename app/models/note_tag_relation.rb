class NoteTagRelation < ApplicationRecord
  belongs_to :note
  belongs_to :tag

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id note_id tag_id updated_at tag_name]
    # 検索可能な属性を追加する必要があります。
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[note tag]
  end
end

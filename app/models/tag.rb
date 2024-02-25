class Tag < ApplicationRecord
  has_many :note_tag_relations
  has_many :notes, through: :note_tag_relations
  validates :tag_name, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id tag_name updated_at]
  end
end

class Note < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes
  has_many :note_tag_relations
  has_many :tags, through: :note_tag_relations

  validates :content, presence: true
  validates :image, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  def self.ransackable_attributes(_auth_object = nil)
    ['content']
  end

  def self.search_by_tag(tag_name)
    joins(:tags).where(tags: { tag_name: })
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[comments genre image_attachment image_blob likes note_tag_relations tags user]
  end
end

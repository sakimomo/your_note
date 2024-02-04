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
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
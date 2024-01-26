class Note < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes

  validates :content, presence: true
  validates :image, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end

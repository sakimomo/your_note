class Note < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :content, presence: true
  validates :image, presence: true
end

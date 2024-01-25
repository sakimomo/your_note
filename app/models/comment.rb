class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note, dependent: :destroy

  validates :content, presence: true
end

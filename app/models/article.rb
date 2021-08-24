class Article < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  scope :ordered_by_priority, -> { order(priority: :desc) }
  has_many :categories
  has_many :votes
  has_one_attached :image
end

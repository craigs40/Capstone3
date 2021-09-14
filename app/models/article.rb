class Article < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :category
  scope :ordered_by_priority, -> { order(priority: :desc) }
  has_many :votes, dependent: :destroy
  has_one_attached :image
end

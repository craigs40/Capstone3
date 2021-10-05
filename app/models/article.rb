class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  scope :ordered_by_priority, -> { order(priority: :desc) }
  has_many :votes, dependent: :destroy
  has_many :users
  has_one_attached :image
  validates :title, :image, :content, :category_id, presence: true
end

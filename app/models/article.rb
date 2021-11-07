class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  scope :ordered_by_priority, -> { order(priority: :desc) }
  has_many :votes, dependent: :destroy
  has_many :users
  has_one_attached :image
  validates :image, :category_id, :content, presence: true, allow_nil: false
  validates :title,
            presence: true,
            length: { maximum: 60 },
            on: :create,
            allow_nil: false
  validates :subtitle,
            presence: true,
            length: { maximum: 150 },
            on: :create,
            allow_nil: false
end

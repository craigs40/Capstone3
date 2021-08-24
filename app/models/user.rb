class User < ApplicationRecord
  validates :name, uninqueness: true
  has_many :articles
  has_many :votes
end

class Vote < ApplicationRecord
  has_many :users
  has_many :articles
end

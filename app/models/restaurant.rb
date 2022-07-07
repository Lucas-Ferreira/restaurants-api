class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reviews
end

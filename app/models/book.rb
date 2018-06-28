class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships
  has_many :ratings, as: :rateable
end

class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true
end

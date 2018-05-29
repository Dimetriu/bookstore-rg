class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true

  def to_param
    name.split(' ').join('-')
  end
end

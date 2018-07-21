class Category < ApplicationRecord
  has_many :books, dependent: :destroy, counter_cache: :books_count

  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true

  def to_param
    name.split(' ').join('-')
  end
end

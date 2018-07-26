class Book < ApplicationRecord
  include BookAdmin

  serialize :dimensions, BookDimensions
  store_accessor :materials

  attr_accessor :images, :images_cache, :remove_images

  attr_accessor :author_attributes

  belongs_to :category

  has_many :authorships, inverse_of: :book
  has_many :authors, through: :authorships, inverse_of: :books
  # has_many :order_items, inverse_of: :book
  # has_many :orders, through: :order_items, inverse_of: :books
  has_many :ratings, as: :rateable

  mount_uploaders :images, ImageUploader

  def author_enum
    Author.all.collect { |a| [a.full_name, a.id] }
  end
end

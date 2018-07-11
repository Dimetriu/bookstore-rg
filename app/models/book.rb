class Book < ApplicationRecord
  include BookAdmin

  attr_accessor :images, :images_cache, :remove_images

  attr_accessor :author_attributes

  belongs_to :category

  has_many :authorships
  has_many :authors, through: :authorships
  has_many :ratings, as: :rateable

  mount_uploaders :images, ImageUploader

  def author_enum
    Author.all.collect { |a| [a.full_name, a.id] }
  end
end

class Book < ApplicationRecord
  attr_accessor :attachments, :attachments_cache, :remove_attachments

  # attr_accessor :author_id
  attr_accessor :author_attributes

  belongs_to :category

  has_many :authorships
  has_many :authors, through: :authorships
  has_many :ratings, as: :rateable

  # mount_uploaders :attachments, ImageUploader

  # store_in_background :attachments

  include BookAdmin

  def author_enum
    Author.all.collect { |a| [a.full_name, a.id] }
  end
end

class Book < ApplicationRecord

  attr_accessor :attachments, :attachments_cache, :remove_attachments

  has_many :authorships
  has_many :authors, through: :authorships
  has_many :ratings, as: :rateable

  mount_uploaders :attachments, ImageUploader

  store_in_background :attachments

end

class Author < ApplicationRecord
  has_many :authorships
  has_many :books, through: :authorships

  attr_accessor :full_name

  def full_name
    self[:first_name] + " " + self[:last_name]
  end

end

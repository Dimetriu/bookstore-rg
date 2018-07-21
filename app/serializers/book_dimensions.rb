class BookDimensions
  include Virtus.model

  attribute :height, String
  attribute :width, String
  attribute :depth, String

  def self.dump(dimensions)
    dimensions.to_h
  end

  def self.load(dimensions)
    new(dimensions)
  end
end

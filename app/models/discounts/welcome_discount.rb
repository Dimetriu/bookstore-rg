module Discounts
  class WelcomeDiscount < ApplicationRecord
    belongs_to :user

    before_save :generate_number

    def use!
      self[:used_at] = DateTime.current
      save!
    end

    private
      def generate_number
        number ||= []
        9.times { number << rand(9) }
        self[:number] = number.join
      end
  end
end

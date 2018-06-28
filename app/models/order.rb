class Order < ApplicationRecord
  include AASM

  aasm :column => 'state' do
  end
end

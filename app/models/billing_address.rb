class BillingAddress < ApplicationRecord
  belongs_to :user, inverse_of: :billing_address
end

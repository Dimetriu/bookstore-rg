module CartHelper
  def user_signed_in_and_order_exists
    (user_signed_in? && current_user.orders.any?)
  end
end

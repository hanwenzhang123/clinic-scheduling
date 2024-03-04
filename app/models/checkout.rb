class Checkout < ApplicationRecord
  belongs_to :shopping_cart

  before_create :calculate_total_price

  def calculate_total_price
    self.total_price = shopping_cart.cart_items.sum { |cart_item| cart_item.product.price * cart_item.quantity if cart_item.product }
  end

  def generate_receipt
    receipt = "Receipt:\n"

    shopping_cart.cart_items.each do |item|
      receipt += "#{item.product.name}: $#{item.product.price}/unit * #{item.quantity} = $#{item.product.price * item.quantity}\n"
    end

    receipt += "Total: $#{total_price}\n"
    receipt
  end
end
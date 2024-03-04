class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product, optional: true
  belongs_to :bundle, optional: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_price
    product.price * quantity if product
  end
end

class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_item(item)
    existing_cart_item = cart_items.find_by(product_id: item.id)

    if existing_cart_item
      existing_cart_item.update(quantity: existing_cart_item.quantity + 1)
    else
      cart_items.create(product: item, quantity: 1)
    end
  end

  def total_items
    cart_items.sum(&:quantity)
  end

  def total_price
    cart_items.sum { |cart_item| cart_item.product.price * cart_item.quantity }
  end
end
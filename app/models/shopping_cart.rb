class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_item(item)
    if item.is_a?(Product)
      existing_cart_item = CartItem.find_by(product_id: item.id, shopping_cart_id: self.id)
      if existing_cart_item
        existing_cart_item.update(quantity: existing_cart_item.quantity + 1)
      else
        CartItem.create(product: item, quantity: 1, shopping_cart_id: self.id)
      end
    elsif item.is_a?(Bundle)
      item.products.each do |product|
        existing_cart_item = CartItem.find_by(product_id: product.id, shopping_cart_id: self.id)
        if existing_cart_item
        existing_cart_item.update(quantity: existing_cart_item.quantity + 1)
        else
          CartItem.create(product: product, quantity: 1, shopping_cart_id: self.id)
        end
      end
    end
  end

  private

  def find_existing_cart_item(item)
    product_ids = item.is_a?(Bundle) ? item.products.pluck(:id) : [item.id]
    product_ids.each do |product_id|
      CartItem.find_by(product_id: product_id, shopping_cart_id: self.id)
    end
  end

  def create_cart_items(item)
    product_ids = item.is_a?(Bundle) ? item.products.pluck(:id) : [item.id]
    product_ids.each do |product_id|
      CartItem.create(product_id: product_id, quantity: 1, shopping_cart_id: self.id)
    end
  end

  def total_items
    self.cart_items.sum(&:quantity)
  end

  def total_price
    self.cart_items.sum { |cart_item| cart_item.product.price * cart_item.quantity }
  end
end
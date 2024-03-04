class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_item(item)
    if item.is_a?(Product)
      add_product_to_cart(item)
    elsif item.is_a?(Bundle)
      add_bundle_to_cart(item)
    end
  end

  private

  def add_product_to_cart(product)
    update_or_create_cart_item(product)
  end

  def add_bundle_to_cart(bundle)
    bundle.products.each { |product| update_or_create_cart_item(product, bundle.id) }
  end

  def update_or_create_cart_item(item, bundle_id = nil)
    existing_cart_item = CartItem.find_by(product_id: item.id, shopping_cart_id: self.id, bundle_id: bundle_id)

    if existing_cart_item
      existing_cart_item.update(quantity: existing_cart_item.quantity + 1)
    else
      CartItem.create(product: item, quantity: 1, shopping_cart_id: self.id, bundle_id: bundle_id)
    end
  end

  def total_items
    self.cart_items.sum(&:quantity)
  end

  def total_price
    self.cart_items.sum { |cart_item| cart_item.product.price * cart_item.quantity }
  end
end
class ShoppingCartController < ApplicationController
  before_action :authenticate_user!

  def get_current_user
    @current_user ||= User.first
  end

  def add_to_cart
    user = @current_user
    item = find_item(params[:product_id], params[:bundle_id])

    if item
      add_item_to_cart(item, user)
      render json: { message: "#{item.class.name} added to cart successfully" }
    else
      render json: { error: 'Item not found. Specify either product_id or bundle_id.' }, status: :not_found
    end
  end

  def add_bundle_to_cart(bundle, user)
    add_item_to_cart(bundle, user)
  end

  def add_product_to_cart(product, user)
    add_item_to_cart(product, user)
  end

  def checkout
    bundle = Bundle.find_by(id: params[:bundle_id])
    checkout = Checkout.create(bundle: bundle)

    render json: { receipt: checkout.generate_receipt }
  end

  private

  def authenticate_user
    unless user_signed_in?
      sign_in(User.first)
    end
  end

  def find_item(product_id, bundle_id)
    product_id ? Product.find_by(id: product_id) : Bundle.find_by(id: bundle_id)
  end

  def add_item_to_cart(item, user)
    shopping_cart = ShoppingCart.find_or_create_by(user_id: user.id)
    shopping_cart.add_item(item)
  end
end

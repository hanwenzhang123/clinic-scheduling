class ShoppingCartController < ApplicationController
  def add_to_cart
    product = Product.find(params[:product_id])
    bundle = Bundle.find(params[:bundle_id])
    
    if bundle
      add_bundle_to_cart(bundle)
    elsif product
      add_product_to_cart(product)
    else
      render json: { error: 'Invalid request. Specify either product_id or bundle_id.' }, status: :bad_request
    end

    render json: { message: 'Item added to cart successfully' }
  end

  def checkout
    bundle_id = params[:bundle_id]
    bundle = Bundle.find_by(id: bundle_id)
    checkout = Checkout.create(bundle: bundle)

    render json: { receipt: checkout.generate_receipt }
  end

  private

  def add_product_to_cart(product)
    if product
      add_item_to_cart(product)
      render json: { message: 'Product added to cart successfully' }
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  def add_bundle_to_cart(bundle)
    if bundle
      add_item_to_cart(bundle)
      render json: { message: 'Bundle added to cart successfully' }
    else
      render json: { error: 'Bundle not found' }, status: :not_found
    end
  end

  def add_item_to_cart(item)
    shopping_cart = ShoppingCart.find_or_create_by(user_id: current_user.id)
    shopping_cart.add_item(item)
  end
end

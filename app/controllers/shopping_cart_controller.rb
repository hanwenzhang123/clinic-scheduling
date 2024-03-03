class ShoppingCartController < ApplicationController
  def add_to_cart
    product = Product.find(params[:product_id])
    bundle = Bundle.find_by(id: params[:bundle_id])
    
    if bundle
      bundle.products.each do |bundle_product|
        CartItem.create(bundle: bundle, product: bundle_product)
      end
    else
      CartItem.create(product: product)
    end

    render json: { message: 'Item added to cart successfully' }
  end

  def checkout
    bundle_id = params[:bundle_id]
    bundle = Bundle.find_by(id: bundle_id)
    checkout = Checkout.create(bundle: bundle)

    render json: { receipt: checkout.generate_receipt }
  end
end

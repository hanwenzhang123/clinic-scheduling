class Checkout < ApplicationRecord
  belongs_to :bundle, optional: true

  def generate_receipt
    items = bundle ? bundle.products : CartItem.joins(:product).where(bundle_id: nil).map(&:product)  #{ |item| item.product }
    total_price = items.sum(&:price)  #items.sum { |item| item.price }
    
    receipt = "Receipt:\n"
    items.each do |item|
      receipt += "#{item.name}: $#{item.price}\n"
    end
    receipt += "Total: $#{total_price}\n"

    receipt
  end
end

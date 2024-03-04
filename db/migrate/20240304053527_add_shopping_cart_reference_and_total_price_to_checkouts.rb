class AddShoppingCartReferenceAndTotalPriceToCheckouts < ActiveRecord::Migration[7.0]
  def change
    add_reference :checkouts, :shopping_cart, foreign_key: true
    add_column :checkouts, :total_price, :decimal
  end
end

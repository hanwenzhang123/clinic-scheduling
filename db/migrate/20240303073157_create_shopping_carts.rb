class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.references :user, foreign_key: true
      t.timestamps
    end

    change_table :cart_items do |t|   #each CartItem belongs to a ShoppingCart
      t.references :shopping_cart, foreign_key: true
      t.change :product_id, :integer, null: true
      t.change :bundle_id, :integer, null: true
    end
  end
end

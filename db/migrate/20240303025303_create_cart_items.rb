class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :bundle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

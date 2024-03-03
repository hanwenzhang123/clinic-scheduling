class AddDiscountToBundles < ActiveRecord::Migration[7.0]
  def change
    add_column :bundles, :discount, :decimal
  end
end

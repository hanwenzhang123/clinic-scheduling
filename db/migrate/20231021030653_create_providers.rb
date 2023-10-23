class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    drop_table :providers, if_exists: true
    
    create_table :providers do |t|
      t.references :user, index: true, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.string :speciality
      
      t.timestamps
    end
  end
end

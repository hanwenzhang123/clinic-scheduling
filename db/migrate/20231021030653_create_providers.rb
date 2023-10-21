class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    drop_table :providers, if_exists: true
    
    create_table :providers do |t|
      t.string :speciality
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

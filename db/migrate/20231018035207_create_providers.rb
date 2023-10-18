class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :speciality
      t.string :email
      
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users, if_exists: true

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end

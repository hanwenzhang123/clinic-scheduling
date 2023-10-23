class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    drop_table :messages, if_exists: true

    create_table :messages do |t|
      t.references :consultation, index: true, optional: true, foreign_key: true
      t.string :text, null: false
      
      t.timestamps
    end
  end
end
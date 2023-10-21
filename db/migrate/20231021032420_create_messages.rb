class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.references :consultation, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
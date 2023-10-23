class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    drop_table :members, if_exists: true

    create_table :members do |t|
      t.references :user, index: true, null: false, foreign_key: { to_table: :users, on_delete: :cascade }

      t.timestamps
    end
  end
end   
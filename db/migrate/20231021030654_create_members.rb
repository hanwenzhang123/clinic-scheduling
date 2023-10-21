class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    drop_table :members, if_exists: true

    create_table :members do |t|
      t.integer :upcoming_consultation_id, null: true
      t.text :past_consultation_ids, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    drop_table :consultations, if_exists: true

    create_table :consultations do |t|
      t.references :provider, index: true, null: false, foreign_key: { to_table: :providers, on_delete: :cascade }
      t.references :member, index: true, null: false, foreign_key: { to_table: :members, on_delete: :cascade }
      t.string :status
      t.string :start_time
      t.string :end_time
      t.date :appointment_date

      
      t.timestamps
    end
  end
end

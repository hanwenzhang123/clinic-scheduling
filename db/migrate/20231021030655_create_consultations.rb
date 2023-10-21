class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    drop_table :consultations, if_exists: true

    create_table :consultations do |t|
      t.string :status
      t.string :start_time
      t.string :end_time
      t.date :appointment_date
      t.references :provider, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

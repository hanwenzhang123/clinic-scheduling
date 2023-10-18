class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.string :start_time
      t.string :end_time
      t.date :appointment_date
      
      t.timestamps
    end
  end
end

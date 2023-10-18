class CreateProviderAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :provider_availabilities do |t|
      t.integer :provider_id, index: true, foreign_key: true
      t.string :day_of_week
      t.string :shift_start_time
      t.string :shift_end_time

      t.timestamps
    end
  end
end

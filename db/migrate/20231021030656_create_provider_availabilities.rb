class CreateProviderAvailabilities < ActiveRecord::Migration[7.0]
  def change
    drop_table :provider_availabilities, if_exists: true

    create_table :provider_availabilities do |t|
      t.string :day_of_week
      t.string :shift_start_time
      t.string :shift_end_time
      t.references :provider, index: true, foreign_key: true

      t.timestamps
    end
  end
end

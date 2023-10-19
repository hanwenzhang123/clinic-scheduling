class AddProviderIdToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_reference :consultations, :provider, null: false, foreign_key: true
  end
end

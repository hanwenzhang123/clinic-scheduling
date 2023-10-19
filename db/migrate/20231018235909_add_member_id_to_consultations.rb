class AddMemberIdToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_reference :consultations, :member, null: false, foreign_key: true
  end
end

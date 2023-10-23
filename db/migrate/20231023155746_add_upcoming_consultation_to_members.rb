class AddUpcomingConsultationToMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :consultation, optional: true, null: true, foreign_key: { to_table: :consultations, on_delete: :cascade }
    add_column :members, :past_consultation_ids, :integer, array: true, default: []
  end
end

class AddConsultationInformationToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :upcoming_consultation_id, :integer, null: true
    add_column :members, :past_consultation_ids, :text, array: true, default: []
  end
end

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :upcoming_consultation, class_name: "Consultation", foreign_key: :consultation_id, optional: true
  has_one :provider, through: :upcoming_consultation
end

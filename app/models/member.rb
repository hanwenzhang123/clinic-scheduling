class Member < ApplicationRecord
  belongs_to :user
  has_many :consultations
  has_many :providers, through: :consultations
end

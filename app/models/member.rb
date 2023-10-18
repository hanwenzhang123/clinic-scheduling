class Member < ApplicationRecord
  has_many :consultations
  has_many :providers, through: :consultations
end

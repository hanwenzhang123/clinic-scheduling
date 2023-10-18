class Provider < ApplicationRecord
  has_many :provider_availabilities
  has_many :consultations
  has_many :members, through: :consultations
end

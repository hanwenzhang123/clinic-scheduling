class Provider < ApplicationRecord
  belongs_to :user
  has_many :provider_availabilities
  has_many :consultations
  has_many :members, through: :consultations
end

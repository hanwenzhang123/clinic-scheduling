class Consultation < ApplicationRecord
  belongs_to :member
  belongs_to :provider
end

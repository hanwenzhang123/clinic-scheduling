class Consultation < ApplicationRecord
  has_one :provider_id, index: true, foreign_key: true
  has_one :member_id, index: true, foreign_key: true
end

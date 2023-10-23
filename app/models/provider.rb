class Provider < ApplicationRecord
  belongs_to :user
  has_many :consultation
  has_many :member, through: :consultation
end

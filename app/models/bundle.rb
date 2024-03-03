class Bundle < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  attribute :discount, :decimal
end

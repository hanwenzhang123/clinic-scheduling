class User < ApplicationRecord
  has_one :shopping_cart, dependent: :destroy, required: false
end

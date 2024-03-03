class CartItem < ApplicationRecord
  belongs_to :shopping_cart, optional: true
  belongs_to :product, optional: true
  belongs_to :bundle, optional: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validate :product_or_bundle_present

  private

  def product_or_bundle_present
    unless product.present? || bundle.present?
      errors.add(:base, "Either a Product or a Bundle must be present")
    end
  end
end

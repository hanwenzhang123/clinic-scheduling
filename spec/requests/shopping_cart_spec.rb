require 'rails_helper'

RSpec.describe "ShoppingCarts", type: :request do
  describe "GET /add_to_cart" do
    it "returns http success" do
      get "/shopping_cart/add_to_cart"
      expect(response).to have_http_status(:success)
    end
  end

end

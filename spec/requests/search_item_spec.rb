require 'rails_helper'

RSpec.describe "SearchItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/search_item/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/search_item/create"
      expect(response).to have_http_status(:success)
    end
  end

end

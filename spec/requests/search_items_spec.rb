require 'rails_helper'

RSpec.describe 'SearchItems', type: :request do
  before(:each) do
    @user = create(:user)
    @search_item = create(:search_item, user: @user)
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/search_items/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/search_items/create'
      expect(response).to have_http_status(:success)
    end
  end
end

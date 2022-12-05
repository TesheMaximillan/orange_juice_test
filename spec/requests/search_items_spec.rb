require 'rails_helper'

RSpec.describe 'SearchItems', type: :request do
  before(:each) do
    @user = create(:user)
    @search_item = create(:search_item, user: @user)
  end

  describe 'search_items#index' do
    it 'should return a 200 response' do
      get search_items_path
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      get search_items_path
      expect(response).to render_template('index')
    end
  end

  describe 'search_items#new' do
    it 'should return a 200 response' do
      get new_search_item_path
      expect(response).to have_http_status(200)
    end

    it 'should render the new template' do
      get new_search_item_path
      expect(response).to render_template('new')
    end
  end
end

require 'rails_helper'

RSpec.describe 'SearchItems', type: :request do
  before(:each) do
    @user = User.create(username: 'test')
    post sessions_path, params: { username: @user.username }
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

  describe 'search_items#create' do
    it 'should create a new search item' do
      post search_items_path, params: { search_item: { text: 'test1' }, user_id: @user.id }
      expect(response).to have_http_status(201)
    end
  end
end

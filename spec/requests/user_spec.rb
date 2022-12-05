require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'home#index' do
    it 'should return a 200 response' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      get root_path
      expect(response).to render_template('index')
    end
  end

  describe 'users#new' do
    it 'should return a 200 response' do
      get new_user_path
      expect(response).to have_http_status(200)
    end

    it 'should render the new template' do
      get new_user_path
      expect(response).to render_template('new')
    end
  end

  describe 'users#create' do
    it 'should create a new user' do
      post user_index_path, params: { user: { username: 'test1' } }
      expect(response).to have_http_status(200)
    end
  end
end

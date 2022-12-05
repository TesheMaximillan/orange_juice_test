require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'sessions#create' do
    it 'should login' do
      user = User.create(username: 'test2')
      post sessions_path, params: { username: user.username }
      expect(response).to have_http_status(302)
    end
  end

  describe 'sessions#logout' do
    it 'should logout' do
      user = User.create(username: 'test3')
      post sessions_path, params: { username: user.username }
      delete logout_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'sessions#new' do
    it 'should return a 200 response' do
      get new_session_path
      expect(response).to have_http_status(200)
    end
  end
end

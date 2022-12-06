require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'sessions#new' do
    it 'should return a 200 response' do
      get new_session_path
      expect(response).to have_http_status(200)
    end

    it 'should render the new template' do
      get new_session_path
      expect(response).to render_template('new')
    end
  end

  describe 'sessions#create' do
    it 'should create a new session' do
      post sessions_path, params: { user: { username: 'test1' } }
      expect(response).to have_http_status(302)
    end
  end

  describe 'sessions#logout' do
    it 'should logout' do
      delete logout_path
      expect(response).to have_http_status(302)
    end

    it 'should redirect to root path' do
      delete logout_path
      expect(response).to redirect_to(new_session_path)
    end
  end
end

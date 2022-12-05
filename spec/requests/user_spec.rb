require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'user#login' do
    it 'returns http success' do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end
end

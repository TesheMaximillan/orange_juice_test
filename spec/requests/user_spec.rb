require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'home#index' do
    it 'should return a 200 response' do
      get '/'
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      get '/'
      expect(response).to render_template('index')
    end
  end
end

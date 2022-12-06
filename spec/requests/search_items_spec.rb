require 'rails_helper'

RSpec.describe 'SearchItems', type: :request do
  describe 'search_items#index' do
    it 'should return a 200 response' do
      get search_items_path
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      get search_items_path
      expect(response).to render_template('new')
    end
  end
end

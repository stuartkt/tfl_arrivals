require 'rails_helper'

RSpec.describe ArrivalsController, type: :controller do
  describe 'GET #index', :vcr do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
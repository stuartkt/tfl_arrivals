# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArrivalsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      VCR.use_cassette('tfl_arrivals') do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end

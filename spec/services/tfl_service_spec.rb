# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TflService do
  describe 'fetch_arrivals' do
    it 'returns an array of arrivals' do
      VCR.use_cassette('tfl_arrivals') do
        arrivals = described_class.fetch_arrivals
        expect(arrivals).to be_an(Array)
        expect(arrivals.first).to include('timeToStation', 'platformName', 'lineName', 'destinationName')
      end
    end
  end
end

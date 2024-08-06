require 'net/http'
require 'json'

class TflService
  TFL_API_URL = 'https://api.tfl.gov.uk/StopPoint/940GZZLUGPS/Arrivals?mode=tube'.freeze

  def self.fetch_arrivals
    uri = URI(TFL_API_URL)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
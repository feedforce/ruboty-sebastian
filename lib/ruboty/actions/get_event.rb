require 'net/http'
require 'uri'
require 'nokogiri'
 
module TokyoDomeEvent 
  def get_event_from_cityhall
    uri = URI.parse("http://www.tokyo-dome.co.jp/tdc-hall/event/")
 
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri.path)
    end
 
    doc = Nokogiri::HTML.parse(response.body.force_encoding('UTF-8')) 
  end
 
  def get_event_from_dome
  end
end

require 'net/http'
require 'uri'
require 'nokogiri'
 
module TokyoDomeEvent 
  def get_event_from_cityhall
    now = Time.now
    url = "http://www.tokyo-dome.co.jp/tdc-hall/event/"
    uri = URI.parse(url)
 
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri.path)
    end
 
    doc = Nokogiri::HTML.parse(response.body.force_encoding('UTF-8'))
 
    column = doc.xpath("//span[text()=#{now.day}]/following-sibling::*")
    return nil if column.nil?

    title    = column.children.text.strip
    fragment = column.children.first.values

    {title: title, url: url+fragment}
  end
 
  def get_event_from_dome
  end
end

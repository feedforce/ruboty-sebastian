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

    title = column.children.text.strip

    unless title.empty? || title == "【reserved】"
      fragment = column.children.first.values.first.to_s
    else
      return nil
    end

    {title: title, url: url+fragment}
  end
 
  def get_event_from_dome
    now = Time.now
    uri = URI.parse("http://www.tokyo-dome.co.jp/dome/schedule/?y=#{now.year}&m=#{now.month}")
 
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get("#{uri.path}?#{uri.query}")
    end

    doc = Nokogiri::HTML.parse(response.body.force_encoding('UTF-8'))
  end
end

require 'net/http'
require 'uri'
require 'nokogiri'
 
module TokyoDomeEvent 
  def get_event_from_cityhall(now)
    url = "http://www.tokyo-dome.co.jp/tdc-hall/event/"

    doc = get_parse_data(url)
 
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
 
  def get_event_from_dome(now)
    uri = URI.parse("http://www.tokyo-dome.co.jp/dome/schedule/")

    doc = get_parse_data(url)

    column = doc.xpath("//th[contains(./text(), '#{target.day}日')]/following-sibling::*")
    return nil if column.nil?
 
    titles = column.xpath(".//p")
    return nil if titles[0].nil? && titles[1].nil?
 
    title = titles[0].children.attribute('alt').value.strip
    vs = titles[1].children.text.strip

    {title: title, vs: vs}
  end

  def get_parse_data(url)
    uri = URI.parse(url)
 
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri.path)
    end
 
    Nokogiri::HTML.parse(response.body.force_encoding('UTF-8'))
  end
end

require 'open-uri'
require 'nokogiri'
 
module TokyoDomeEvent 
  def get_event_from_cityhall(now)
    url = "http://www.tokyo-dome.co.jp/tdc-hall/event/"
    doc = Nokogiri::HTML.parse(open(url).read.force_encoding('UTF-8'))

    column = doc.css("td[id='date_cell_%4d-%02d-%02d'] div" % [now.year, now.month, now.day])
    return if column.empty?

    title = column.text.strip

    unless title.empty? || title == "【reserved】"
      fragment = column.at("a").values[0].to_s
    else
      return
    end

    {title: title, url: url+fragment}
  end
 
  def get_event_from_dome(now)
    url = "http://www.tokyo-dome.co.jp/dome/schedule/"
    doc = Nokogiri::HTML.parse(open(url).read.force_encoding('UTF-8'))

    column = doc.xpath("//th[contains(./text(), '#{now.day}日')]/following-sibling::*")
    titles = column.xpath(".//p")
    return if titles[0].nil? && titles[1].nil?

    title = titles[0].children.attribute('alt').value.strip
    vs = titles[1].children.text.strip

    {title: title, vs: vs}
  end
end

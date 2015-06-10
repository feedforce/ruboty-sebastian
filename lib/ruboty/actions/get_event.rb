require 'open-uri'
require 'nokogiri'
 
module TokyoDomeEvent 
  def get_event_from_cityhall(now)
    url = "http://www.tokyo-dome.co.jp/tdc-hall/event/"
    doc = Nokogiri::HTML.parse(open(url).read.force_encoding('UTF-8'))

    column = doc.css("#date_cell_%4d-%02d-%02d" % [now.year, now.month, now.day]).search("a")
    return if column.empty?

    title = column.text.strip

    unless title.empty? || title == "【reserved】"
      fragment = column.attribute("href").value
    else
      return
    end

    {title: title, url: url+fragment}
  end
 
  def get_event_from_dome(now)
    url = "http://www.tokyo-dome.co.jp/dome/schedule/"
    doc = Nokogiri::HTML.parse(open(url).read.force_encoding('UTF-8'))

    column = doc.xpath("//th[contains(./text(), '#{now.day}日')]/following-sibling::*").xpath(".//p")
    return if column[0].nil? && column[1].nil?

    title = column[0].children.attribute('alt').value.strip
    vs = column[1].children.text.strip

    {title: title, vs: vs}
  end
end

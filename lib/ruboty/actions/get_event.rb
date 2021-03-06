require 'open-uri'
require 'nokogiri'

module TokyoDomeEvent
  def get_event_from_cityhall
    url = "http://www.tokyo-dome.co.jp/tdc-hall/event/"
    doc = Nokogiri::HTML.parse(open(url).read.force_encoding('UTF-8'))

    column = doc.css("#date_cell_%4d-%02d-%02d" % [now.year, now.month, now.day]).search("a")
    return if column.empty?

    title = column.text.strip
    return if title.empty? || title == "【reserved】" || title == "【休演日】"

    fragment = column.attribute("href").value

    {title: title, url: url+fragment}
  end

  def get_event_from_dome
    url = "http://www.tokyo-dome.co.jp/dome/schedule/"
    doc = Nokogiri::HTML.parse(open(url).read.force_encoding('UTF-8'))

    column = doc.xpath("//th[contains(./text(), '#{now.day}日')]/..").
      select{|c| c.xpath("./th").text.strip.start_with?("#{now.day}日") }.
      first.xpath("./td//p")
    return if column.empty?

    if column[0].children.search('img').empty?
      title = column.text.strip
      vs = ""
    else
      title = column[0].children.attribute('alt').value.strip
      vs = column[1].children.text.strip
    end

    {title: title, vs: vs}
  end

  def now
    @now ||= Time.now
  end
end

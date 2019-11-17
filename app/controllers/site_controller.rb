class SiteController < ApplicationController
  def index
  end
  def show

  end
  def ps1

  end

  def zero_division_error
    begin
      a=1/0
    rescue ZeroDivisionError=>e
      # logger = RAILS_DEFAULT_LOGGER
      # logger.info 'some info'
      # logger.error 'some error'
      logger.error ([e.message])
      @error_message=e.backtrace
    end
  end
  def news_page

    url="https://www.ait.ac.th/"
    unparsed_page=HTTParty.get(url) #to get Raw HTML Page
    parsed_page=Nokogiri::HTML(unparsed_page)
    listings=parsed_page.css(".row-condensed").css("article.grid.col-md-4.blog-list")
    a1=[]
    listings.each do |listing|
      dict={
          "heading"=>listing.css("h3").text,
          "url"=>listing.css("a")[0].attributes["href"].value,
          "src"=>listing.css("img")[0].attributes["src"].value

      }
      a1.push(dict)

    end
    @result= a1
  end
end

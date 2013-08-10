class SiteController < ApplicationController
  def home
  	@month = 8
    my_flickr = FlickrLib.new
  	@items = Item.where(:season_start.lt => @month,  :season_end.gt => @month )
    @items = @items.map do |item|
      if (item.image_url == nil) then
        my_url = my_flickr.get_image_for_keyword(item.name)
        item.image_url = my_url
      end
      item.save
      # i.name = "monkey"
      item
    end
    puts @items.to_json

    @markets = Market.all
  	render template: "site/home"
  end
  def market
  	render template: "site/market_detail"
  end
  def items
  	render template: "site/items"
  end
end

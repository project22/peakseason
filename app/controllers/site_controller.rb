class SiteController < ApplicationController
  def home
    @month = @@month
    @region = @@region 
    
    my_flickr = FlickrLib.new
  	@items = Item.where(:season_start.lte => @month,  :season_end.gte => @month )
    # @items = Item.all
    @items = @items.map do |item|
      if (item.image_url == nil) then
        # my_url = my_flickr.get_image_for_keyword(item.name + ' produce') 
        # item.image_url = my_url
      end
      item.save
      # i.name = "monkey"
      item
    end

    # get the carousel items.  Just items that started this month.  Maybe add the second month too.
    @carousel_items = Item.where(:season_start.gte => @month, :season_start.lte => @month+1 )

    puts @items.to_json

    @markets = Market.all
    @region =
  	render template: "site/home"
  end
  def market
  	render template: "site/market_detail"
  end
  def items
  	render template: "site/items"
  end
  def vendors
    @vendors = Vendors.all
    # Search for vendors with regions = @region
  end
  def recipes
    @recipes = x 
  end
end

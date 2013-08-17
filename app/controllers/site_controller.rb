class SiteController < ApplicationController
  def home
    

    my_flickr = FlickrLib.new

  	
    # get the carousel items.  Just items that started this month.  Maybe add the second month too.
    @carousel_items = Item.where(:season_start => @month)
    if @carousel_items.count < 4 then
      @carousel_items = Item.where(:season_start.gte => @month, :season_start.lte => @month+1 )
    end

    puts @items.to_json

    
    
  	render template: "site/home"
  end

  def market
  	render template: "site/market_detail"
  end
  def items
  	render template: "site/items"
  end

  def recipes
    @recipes = x 
  end
end

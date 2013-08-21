class SiteController < ApplicationController
  def home
    

    my_flickr = FlickrLib.new

  	
    # get the carousel items.  Just items that started this month.  Maybe add the second month too.
    @carousel_items = Item.where(:season_start => @month)
    if @carousel_items.count < 4 then
      @carousel_items = Item.where(:season_start.gte => @month, :season_start.lte => @month+1 )
    end

    puts @items.to_json

    @markets = []
   
    @markets = []
   
    # @zip is set in ApplicationController
    url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=" + @zip
     
    market_list = HTTParty.get(url)
  
     # newlist = JSON.parse(market_list.body)
     JSON.parse(market_list.body)["results"].each do |item|
       # @market_array.push(item["id"])

       # url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=" + item["id"]
       # market_detail = HTTParty.get(url)

       # market = JSON.parse(market_detail.body)["marketdetails"]
       # market["marketname"] = item["marketname"]
       @markets.push(item)

       # puts item["id"]
     end
    
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

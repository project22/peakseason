class SiteController < ApplicationController
  def home
  	@month = 8
  	@items = Item.where(:season_start.lt => @month,  :season_end.gt => @month )
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

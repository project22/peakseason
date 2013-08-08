class SiteController < ApplicationController
  def hello
  	render template: "site/home"
  end
  def market
  	render template: "site/market_detail"
  end
  def items
  	render template: "site/items"
  end
end

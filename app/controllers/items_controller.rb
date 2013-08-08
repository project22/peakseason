class ItemsController < ApplicationController


  def index
  	# render template: "site/items"
  end

  def show
  	render template: "items/item_detail"
  end
end

class ItemsController < ApplicationController


  def index
  	render template: "site/items"
  end

  def show
  	render template: "site/item_detail"
  end
end



class RecipesController < ApplicationController
  def local_listing
  	@month = session[:month]
    @region = session[:region]
  	# @items = Item.all
  	@items = Item.where(:season_start.lte => @month,  :season_end.gte => @month )

  	# get a list of recipes from an api for specific items that are in season.
  	# Think on this logic
  	# Maybe a filter by certain smaller set of items.  Use ajax to search.  On click of button.
  	# @recipes = x
  	rec_loader = Rec.new
  	ings = params[:q]
  	@recipes = rec_loader.get_rec(ings)
  	puts @recipes
  	# I would like to have the model Rec return a json and convert it in this action.

  end
  def recipes_json
  	rec_loader = Rec.new
  	ings = params[:q]
  	@recipes = rec_loader.get_rec(ings)
  	puts @recipes

  end

end
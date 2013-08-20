class ApplicationController < ActionController::Base
  before_action :set_user_vars

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def set_user_vars

  # Find user's location with browser geofinder
  @user_location

    # Get region by passing user_location to geocoder gem
  @region = Region.find_by(name: "California")


  session[:month]= Date.today.month
  # session[:month]= 2
  @month = session[:month]
  @items = Item.where(:season_start.lte => @month,  :season_end.gte => @month, :region => @region.name )

  search_radius = 20
  @zip = "90210"
  
  # Use geocoder to fill this with markets within search_radius
  # @markets = Market.where(:region => @region)

 
    




  end
  # def month
  # 	8
  # end
end

class ApplicationController < ActionController::Base
  before_action :set_user_vars

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def set_user_vars


  
  @region = Region.find_by(name: "California")

  session[:month]= Date.today.month
  @month = session[:month]
  @items = Item.where(:season_start.lte => @month,  :season_end.gte => @month, :region => @region.name )
  @markets = Market.where(:region => @region)
  # geocoded_by :ip_address

  # @@region= request.location.city

  # @@regions = Region.all
  # @@month = Date.today.month
  # @@month = 4
  # @@local_markets=Market.all
  # session[:local_markets] ||= Market.all
  end
  # def month
  # 	8
  # end
end

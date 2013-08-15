class ApplicationController < ActionController::Base
  before_action :set_user_vars

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # class variable.  Shared between all instances. Inherrited.
  # @@region= "California"
  private
  def set_user_vars

  session[:region]="California"
  session[:month]= Date.today.month
  # geocoded_by :ip_address

  # @@region= request.location.city

  # @@regions = Region.all
  # @@month = Date.today.month
  # @@month = 4
  # @@local_markets=Market.all
  session[:local_markets] ||= Market.all
  end
  # def month
  # 	8
  # end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # class variable.  Shared between all instances. Inherrited.
  @@region= "California"
  # geocoded_by :ip_address

  # @@region= request.location.city

  @@regions = Region.all
  @@month = Date.today.month
  @@local_markets=Market.all

  # def month
  # 	8
  # end
end

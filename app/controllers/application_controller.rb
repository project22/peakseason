class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # class variable.  Shared between all instances. Inherrited.
  @@region= "California"
  @@regions = Region.all
  @@month = Date.today.month
  # def month
  # 	8
  # end
end

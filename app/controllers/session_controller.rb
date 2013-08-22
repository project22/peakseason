class SessionController < ApplicationController

	def setlocation
		session[:lat] = 40.6928
		session[:long] = 73.9903
		redirect_to root
	end

end
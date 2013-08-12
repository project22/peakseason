class VendorsController < ApplicationController
	def show
	end

	def local_listing
		@vendors = Vendor.all
	end
end

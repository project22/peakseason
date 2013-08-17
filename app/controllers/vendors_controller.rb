class VendorsController < ApplicationController


	def index
		@region = Region.find(params[:region_id])
		@vendors = @region.vendors.all
	end

	def new
		@region = Region.find(params[:region_id])
		# @vendor = Vendor.new
  end

  def create
  	@region = Region.find(params[:region_id])
  	@vendor = @region.vendors.create(params[:vendor].permit(:name, :description, :url, :image_url, :twitter_id ))
  	redirect_to region_vendors_path(@region)
  end

  def show
  	@region = Region.find(params[:region_id])
  	@vendor = @region.vendors.find(params[:id])
    @items = @vendor.items
    @markets = 2
	end
	def edit
  	@region = Region.find(params[:region_id])
  	@vendor = @region.vendors.find(params[:id])
	end

# FIX THIS
	def update
    respond_to do |format|
    	@region = Region.find(params[:region_id])
    	@vendor = @region.vendors.find(params[:id])
# region_vendor GET    /regions/:region_id/vendors/:id(.:format)  
      if @vendor.update(params[:vendor].permit(:name, :description, :url, :image_url, :twitter_id )   )
        format.html { redirect_to region_vendor_path(@region, @vendor), notice: 'Vendor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end



end

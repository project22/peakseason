
class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]



  # GET /market
  # GET /market.json
  def index
    @markets = Market.all
  end

  def local_listing
  	@markets = Market.all
  	# This one needs to filter by only those in local region.
  	# nested something

  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @items = Item.all
    # This needs to be replaced with only items in this market.
    @vendors = Vendor.all
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to @market, notice: 'Region was successfully created.' }
        format.json { render action: 'show', status: :created, location: @market }
      else
        format.html { render action: 'new' }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to @market, notice: 'Market was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:name, :image_url, :url, :address, :description, :start_time, :end_time, :day_week )
    end
end


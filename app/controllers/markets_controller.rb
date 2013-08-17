
class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /regions/market
  def index
    # @region = Region.find(params[:region_id])
    # @markets = @region.markets.all
  end

  # GET /local_listing
  # def local_listing
  # 	# @markets = Market.all
  # 	# This one needs to filter by only those in local region.
  # 	# nested something
  # end

  # GET /regions/markets/1
  def show
    # @region = Region.find(params[:region_id])
    @items = @region.items.all
    # This needs to be replaced with only items in this market.
    @vendors =  @region.vendors.all
  end

  # GET /regions/markets/new
  def new
    # @region = Region.find(params[:region_id])
    @market = @region.markets.new
    # @market = Market.new
  end

  # GET /regions/1/edit
  def edit

  end

  # POST /regions/markets
  def create
    @market = Market.new(market_params) 
    if @market.save
      redirect_to @market, notice: 'Region was successfully created.'   
    else
     render action: 'new' 
    end
    
  end

  # PATCH/PUT /regions/markets/:id
  def update
    if @market.update(market_params)
      redirect_to @market, notice: 'Market was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /regions/markets/:id
  def destroy
    @market.destroy
    redirect_to markets_url   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @region = Region.find(params[:region_id])
      @markets = @region.markets.all
      @market = @region.markets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:name, :image_url, :url, :address, :description, :start_time, :end_time, :day_week )
    end
end


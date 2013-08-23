
class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /regions/market
  def index
    # render json: market_list
    # render json: @market_array.first['marketname']
  end

  def local_listing
  end

  def getmarkets
    # @market_array = []
   
    # market_id = "1008567"
    # url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=90403"
    # # url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=" + market_id
    
    # market_list = HTTParty.get(url)
  
    #  # newlist = JSON.parse(market_list.body)
    #  JSON.parse(market_list.body)["results"].each do |item|
    #    # @market_array.push(item["id"])

    #    url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=" + item["id"]
    #    market_detail = HTTParty.get(url)

    #    market = JSON.parse(market_detail.body)["marketdetails"]
    #    market["marketname"] = item["marketname"]
    #    @market_array.push(market)

    #    # puts item["id"]
    #  end
    #  puts @market_array 

    # # render json: market_list
    # render json: @market_array.first['marketname']
 
  end

  # GET /regions/:id/markets/1
  def show

  end

  # GET /regions/:id/markets/new
  def new
    # @region = Region.find(params[:region_id])
    @market = Market.new
    # @market = Market.new
  end

  # GET /regions/:id/marekts1/edit
  def edit
    # @market

      # @market.market_times << MarketTime.new
      
  end

  def geocoder
    myaddress =  Geocoder.search @markets.first['Address']
    render json: myaddress
  end

  def localmarkets
     @markets = []

    # @zip is set in ApplicationController
    # url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=" + @zip
    # session[:lat] = "37.7833"
    # session[:lng] = "-122.4167"
    # lat = session[:lat]
    # lng = session[:lng]

    # get lat lng from cookies set by javacript in the application controller.
    lat = cookies[:lat].to_s
    lng = cookies[:lng].to_s

    # lat = request.location.latitude.to_s
    # lng = request.location.longitude.to_s
    # puts "lat:" + request.location.latitude.to_s + "lng:" + request.location.longitude.to_s

    # lat = "34.0219"
    # lng = "-118.4814"
    url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/locSearch?lat=" + lat + "&lng=" + lng
    puts url
     
    market_list = HTTParty.get(url)
  
     # newlist = JSON.parse(market_list.body)
     JSON.parse(market_list.body)["results"].each do |item|
       # @market_array.push(item["id"])

       # url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=" + item["id"]
       # market_detail = HTTParty.get(url)

       # market = JSON.parse(market_detail.body)["marketdetails"]
       # market["marketname"] = item["marketname"]
       @markets.push(item)

       # puts item["id"]
     end
     render "markets/local_listing"
  end

  def detail
    # @market 
   
    puts params
    market_id = params[:id]
    @market_name = params[:name]
    
    url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=" + market_id
    market_detail = HTTParty.get(url)

    @market = JSON.parse(market_detail.body)["marketdetails"]
   
    
    # render json: @market
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
    puts params.to_json
    if @market.update(market_params)
      redirect_to region_market_path(@region, @market), notice: 'Market was successfully updated.' 
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
      # @markets = @region.markets.all

      @market = @region.markets.find(params[:id])
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:name, :image_url, :url, :address, :description)
    end
end
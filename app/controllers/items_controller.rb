class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def local_listing
    @items = Item.all
  end

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
    # both these queries need to be filtered by the item
    # @markets = Market.all
 
    rec_loader = Rec.new
    # ings = params[:q]
    ings = params[:q]
    @recipes = rec_loader.get_rec(URI::escape(@item.name))


    # Find recipes which use this item
    # rec_loader = Rec.new
    # # need to pass the name field of items here.
    # my_item = Post.find(params[:name])
    # ings = params[my_item]
    # @recipes = rec_loader.get_rec(ings)
    @markets = []
   
    # @zip is set in ApplicationController
    url = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=" + @zip
     
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

  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    # get the name and region first and then manually extract and insert into data, the fields for month from the hash.
    data=item_params
    data[:season_start] = params['item']['season_start(2i)']
    data[:season_end] = params['item']['season_end(2i)']

    @item = Item.new(data)

    if @item.save
      format.html { redirect_to @item, notice: 'Item was successfully created.' }      
    else
      format.html { render action: 'new' }
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
    else
      format.html { render action: 'edit' }
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    format.html { redirect_to items_url }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :region, :image_url, :season_start, :season_end)
      # removed the season_end and season_start, because they came in as hashes.  Lame.
    end
end

class Market
 include Mongoid::Document
 include Mongoid::Timestamps

	belongs_to :region, :inverse_of => nil
	has_many :market_times

 field :name, 	type: String
 field :image_url, type: String
 field :url, 	type: String
 field :address, 	type: String
 field :description, 	type: String
 # field :latitude, type: Float
 # field :longitude, type: Float
 # attr_accessible :address
  # geocoded_by :address
  # after_validation :geocode
end

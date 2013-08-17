class Market
 include Mongoid::Document
 include Mongoid::Timestamps

	belongs_to :region, :inverse_of => nil
	embeds_many :market_times

 field :name, 	type: String
 field :image_url, type: String
 field :url, 	type: String
 field :address, 	type: String
 field :description, 	type: String
 field :day_week, type: String
 field :start_time, type: DateTime
 field :end_time, type: DateTime
end

class Market
 include Mongoid::Document
 include Mongoid::Timestamps

has_one :region

 field :name, 	type: String
 field :url, 	type: String
 field :address, 	type: String
 field :description, 	type: String
 field :day_week, type: String
 field :start_time, type: DateTime
 field :end_time, type: DateTime
end

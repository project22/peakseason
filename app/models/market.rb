class Market
 include Mongoid::Document
 include Mongoid::Timestamps

 has_and_belongs_to_many :vendors

 field :name, 	type: String
 field :url, 	type: String
 field :address, 	type: String
 field :description, 	type: String
 field :start_time, type: DateTime
 field :end_time, type: DateTime
end

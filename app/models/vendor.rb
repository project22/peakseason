class Vendor
	
  include Mongoid::Document

  has_and_belongs_to_many :markets

  field :name, type: String
  field :url, type: String
  field :description, type: String
  # Twitter to log times and places, like food trucks
  field :twitter_id, type: String  

  # field :market_id, type: String
  field :integer, type: String
  field :product_name, type: String

end

class Vendor
	
  include Mongoid::Document

  has_and_belongs_to_many :markets
  belongs_to :region
  embeds_many :items

  field :name, type: String
  field :url, type: String
  field :description, type: String
  field :image_url, type: String

  field :twitter_id, type: String  

  field :item_name, type: String
  

end

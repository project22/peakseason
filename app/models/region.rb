class Region
  include Mongoid::Document
  field :name, type: String
  field :country, type: String

  embeds_many :vendors
  embeds_many :items

end

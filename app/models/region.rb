class Region
  include Mongoid::Document
  field :name, type: String
  field :country, type: String

  has_many :markets
  has_many :items

end

class Region
  include Mongoid::Document
  field :name, type: String
  field :country, type: String
end

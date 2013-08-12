class Region
  include Mongoid::Document
  field :name, type: String
  field :country, type: String

  has_many :vendors
  has_and_belongs_to_many :items
  has_many :markets
end

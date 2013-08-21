class Item
  include Mongoid::Document
  # include Mongoid::Timestamps
  # include Mongoid::MultiParameterAttributes
  has_and_belongs_to_many :regions

  field :name, type: String
  field :season_start, type: Integer
  field :season_end, type: Integer
  field :region, type: String
  field :image_url, type: String
  field :description, type: String
end

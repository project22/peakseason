class Item
  include Mongoid::Document
  # include Mongoid::Timestamps
  # include Mongoid::MultiParameterAttributes

  field :name, type: String
  field :season_start, type: Integer
  field :season_end, type: Integer
  field :region, type: String
end

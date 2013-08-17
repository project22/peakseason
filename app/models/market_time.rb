class MarketTime
  include Mongoid::Document
  embedded_in :market

  field :day, type: Integer
  field :start_time, type: Time
  field :end_time, type: Time
end

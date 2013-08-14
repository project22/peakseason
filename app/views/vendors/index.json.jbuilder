json.array!(@markets) do |region|
  json.extract! market, :name
  json.url market_url(market, format: :json)
end

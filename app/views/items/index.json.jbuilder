json.array!(@items) do |item|
  json.extract! item, :name, :season_start, :season_end, :region
  json.url item_url(item, format: :json)
end

json.array!(@urls) do |url|
  json.extract! url, :id, :url_address, :shorten_url, :counter
  json.url url_url(url, format: :json)
end

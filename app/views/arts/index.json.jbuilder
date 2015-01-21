json.array!(@arts) do |art|
  json.extract! art, :id, :title, :description, :image
  json.url art_url(art, format: :json)
end

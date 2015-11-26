json.array!(@seatmaps) do |seatmap|
  json.extract! seatmap, :id, :name
  json.url seatmap_url(seatmap, format: :json)
end

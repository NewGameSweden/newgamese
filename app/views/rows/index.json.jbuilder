json.array!(@rows) do |row|
  json.extract! row, :id, :name, :x_coord, :y_coord
  json.url row_url(row, format: :json)
end

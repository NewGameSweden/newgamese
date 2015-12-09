json.name (@seatmap.name)
json.rows @seatmap.rows do |row|
  json.id row.id
  json.name row.name
  json.x_coord row.x_coord
  json.y_coord row.y_coord
  json.seats row.seats
end

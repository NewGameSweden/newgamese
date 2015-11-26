json.array!(@seats) do |seat|
  json.extract! seat, :id, :number
  json.url seat_url(seat, format: :json)
end

json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :price, :type, :paid, :user_id
  json.url ticket_url(ticket, format: :json)
end

json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :description, :logo, :link
  json.url sponsor_url(sponsor, format: :json)
end

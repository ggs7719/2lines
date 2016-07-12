json.array!(@parents) do |parent|
  json.extract! parent, :id
  json.url parent_url(parent, format: :json)
end

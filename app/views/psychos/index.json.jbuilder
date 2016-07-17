json.array!(@psychos) do |psycho|
  json.extract! psycho, :id
  json.url psycho_url(psycho, format: :json)
end

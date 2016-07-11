json.array!(@prenatals) do |prenatal|
  json.extract! prenatal, :id
  json.url prenatal_url(prenatal, format: :json)
end

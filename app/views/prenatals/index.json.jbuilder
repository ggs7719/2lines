json.array!(@prenatals) do |prenatal|
  json.extract! prenatal, :id, :created_at, :date, :title, :content, :status, :mother_id, :father_id
  json.url prenatal_url(prenatal, format: :json)
end

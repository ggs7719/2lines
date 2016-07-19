json.TotalCount do
  json.total Prenatal.count
end

json.data @prenatals do |prenatal|

  json.id prenatal.id
  json.created_at prenatal.created_at
  json.title prenatal.title
  json.content prenatal.content
  json.message prenatal.message
  json.date prenatal.date
  json.read_status prenatal.status
end
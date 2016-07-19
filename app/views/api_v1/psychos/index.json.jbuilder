json.TotalCount do
  json.total Psycho.count
end

json.data @psychos do |psycho|

  json.id psycho.id
  json.created_at psycho.created_at
  json.title psycho.title
  json.content psycho.content
  json.message psycho.message
  json.date psycho.date
  json.read_status psycho.status
end
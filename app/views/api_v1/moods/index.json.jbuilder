
json.data @moods do |mood|

  json.id mood.id
  json.created_at mood.created_at
  json.title mood.title
  json.content mood.content
  json.message mood.message
  json.date mood.date
  json.read_status mood.status
end
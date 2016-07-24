

json.data @datas do |data|

  json.id data.id
  json.created_at data.created_at
  json.title data.title
  json.content data.content
  json.message data.message
  json.date data.date
  json.read_status data.status
end
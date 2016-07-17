json.TotalCount do
  json.total Quest.count
end

json.data @quests do |quest|

  json.created_at quest.created_at
  json.title quest.title
  json.content quest.content
  json.message quest.message
  json.date quest.date
  json.read_status quest.status
  json.done quest.done
end
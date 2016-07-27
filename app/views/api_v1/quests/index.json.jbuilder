
json.data @quests do |quest|

  json.id quest.id
  json.created_at quest.created_at
  json.title quest.title
  json.content quest.content
  json.message quest.message
  json.date quest.date
  json.read_status quest.status
  json.done quest.done
  json.delete quest.remove
  json.pic    quest.pic
end

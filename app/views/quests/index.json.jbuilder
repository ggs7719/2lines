json.array!(@quests) do |quest|
  json.extract! quest, :id
  json.url quest_url(quest, format: :json)
end

json.array!(@quests) do |quest|
  json.extract! quest, :id, :created_at, :title, :content, :status, :mother_id, :father_id, :done
  json.url quest_url(quest, format: :json)
end

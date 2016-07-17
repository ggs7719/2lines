json.array!(@moods) do |mood|
  json.extract! mood, :id
  json.url mood_url(mood, format: :json)
end

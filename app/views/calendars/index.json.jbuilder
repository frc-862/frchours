json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :day, :hours
  json.url calendar_url(calendar, format: :json)
end

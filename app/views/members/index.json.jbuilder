json.array!(@members) do |member|
  json.extract! member, :id, :last_name, :first_name, :grade, :email
  json.url member_url(member, format: :json)
end

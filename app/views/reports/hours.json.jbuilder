json.array!(@members) do |member|
  json.extract! member, :last_name, :first_name, :grade, :email, :student_id
  json.hours member.hours
end

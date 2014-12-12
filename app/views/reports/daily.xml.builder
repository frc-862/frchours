xml.members do 
  @members.each do |member|
    xml.member do
      xml.last_name member.last_name
      xml.last_name member.first_name
      xml.grade member.grade
      xml.email member.email
      xml.student_id member.student_id
      xml.hours member.hours
    end
  end
end


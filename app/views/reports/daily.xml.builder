xml.members do 
  @members.each do |member|
    xml.member do
      xml.last_name member.last_name
      xml.last_name member.first_name
      xml.grade member.grade
      xml.email member.email
      xml.student_id member.student_id
      xml.meetings do
        member.hours.each do |hours|
          xml.meeting do
            xml.start hours.first
            if member.hours.size > 1
              xml.stop hours.last
            end
          end
        end
      end
      xml.mentor member.mentor
    end
  end
end


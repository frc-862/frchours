class Member < ActiveRecord::Base
  has_many :attendances, :foreign_key => 'student_id', :primary_key => 'student_id'
  validates_uniqueness_of :student_id

  before_save :clean_student_id

  def clean_student_id
    if !mentor?
      self.student_id = self.student_id.to_s.gsub(/\D/,"")
    end
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def total_hours
    work_time / 60.0 / 60.0
  end

  def work_time
    attendances.inject(0.0) { |total, att| total + att.duration }
  end

  def mentor_checkin
    raise "Sorry you are not a mentor" unless mentor?

    from = ActiveSupport::TimeZone["EST"].parse(Date.today.to_s).to_datetime
    asize = self.attendances.where("signin >= ?", from).where("signin < ?", from + 1).count
    if asize > 0
      "You have already logged in today"
    else
      to = from + Calendar.hours.hours
      a = attendances.create(:signin => from, :signout => to)
      "Logging #{a.duration_text}"
    end
  end
end

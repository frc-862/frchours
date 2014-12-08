class Attendance < ActiveRecord::Base
  belongs_to :member, :foreign_key => 'student_id', :primary_key => 'student_id'
  validates_presence_of :student_id, :signin

  def duration
    return 0 if signin.blank?
    return 1.hour if signout.blank?
    signout - signin
  end

  def duration_text
    ApplicationController.helpers.distance_of_time_in_words(signin, signout)
  end

  def self.checkin(id, member = nil)
    # check for existing attendance record to check them out
    attendance = Attendance.where(:student_id => id, :signout => nil).first
    name = "Student"
    name = member.name if member
    msg = ""

    if attendance
      if Time.now.localtime.yday != attendance.signin.localtime.yday
        Rails.logger.info "CHECKIN #{attendance.id}: auto signout"
        attendance.signout = attendance.signin + 1.hour
        attendance.save!
        msg = "#{name} auto checked out from #{attendance.signin.to_date}. "
        attendance = nil
      else
        Rails.logger.info "CHECKIN #{attendance.id}: signed out"
        attendance.signout = Time.now
        msg = "#{name} signed out at #{Time.now.localtime}, you worked #{attendance.duration_text}."
        attendance.save!
      end
    end

    if attendance.nil?
      # create the attendance record
      msg += "#{name} signed in at #{Time.now.localtime}."
      attendance = Attendance.create(:student_id => id, :signin => Time.now)
      Rails.logger.info "CHECKING Creating attendance #{attendance.id}"
    end

    msg
  end
end

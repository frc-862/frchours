class CheckinController < ApplicationController
  def index
    @checkin = Attendance.new
  end

  def create
    sid = params[:attendance][:student_id].to_s.gsub(/\D/,"")

    if sid.blank?
      redirect_to checkin_path
      return
    end
    
    Rails.logger.info "Looking up #{sid} (#{params.inspect})"
    member = Member.where(:student_id => sid).first
    Rails.logger.info "Found #{member.inspect}"

    if member.nil?
      flash[:notice] = "Student not found, please add"
      redirect_to new_member_path(:member => {:student_id => sid})
    else
      flash[:notice] = Attendance.checkin(sid, member)
      redirect_to checkin_path
    end
  end
end

class CheckinController < ApplicationController
  before_action :authenticate_admin!, :except => [:mentor_checkin, :mentor]
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

  def mentor_checkin
    @mentor = Member.where(:student_id => params[:student_id]).first

    if @mentor.nil?
      flash[:notice] = "Mentor not found, please add"
      redirect_to new_member_path
    elsif !@mentor.mentor?
      flash[:notice] = "No cheating #{@mentor.name}, login as a student!"
      redirect_to checkin_path
    else
      flash.now[:notice] = @mentor.mentor_checkin
    end
  end

  def mentor
    @mentor = Member.where(:student_id => params[:student_id]).first

    if @mentor.nil?
      flash[:notice] = "Mentor not found, please add"
      redirect_to new_member_path
    elsif !@mentor.mentor?
      flash[:notice] = "No cheating #{@mentor.name}, login as a student!"
      redirect_to checkin_path
    else
      @checkin = @mentor.attendances.new
    end
  end
end

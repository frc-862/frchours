class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @attendances = Attendance.all
    respond_with(@attendances)
  end

  def show
    respond_with(@attendance)
  end

  def new
    @attendance = Attendance.new
    respond_with(@attendance)
  end

  def edit
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.save
    respond_with(@attendance)
  end

  def update
    @attendance.update(attendance_params)
    respond_with(@attendance)
  end

  def destroy
    @attendance.destroy
    respond_with(@attendance)
  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:student_id, :signin, :signout)
    end
end

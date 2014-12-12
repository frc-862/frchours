class ReportsController < ApplicationController
  def members
    @members = Member.order(:last_name, :first_name)
  end

  def hours
    @members = Member.order(:last_name, :first_name).includes(:attendances)
  end

  def daily
    @members = Member.order(:last_name, :first_name).includes(:attendances).joins(:attendances)

    if params[:date]
      @date = ActiveSupport::TimeZone["EST"].parse(params[:date]).to_datetime
    else
      @date = Date.today.to_datetime
    end
    @members = @members.where("attendances.signin >= ? AND attendances.signin < ?",
                              @date, @date + 1)
  end
end

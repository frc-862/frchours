class ReportsController < ApplicationController
  def members
    @members = Member.order(:last_name, :first_name)
  end

  def hours
    @members = Member.order(:last_name, :first_name).includes(:attendances)
  end
end

class Calendar < ActiveRecord::Base
  def self.hours(day = Date.today)
    d = Calendar.where(:day => day).first
    return d.hours if d

    return 8 if day.wday == 6
    return 4 if day.month < 5
    return 2
  end
end

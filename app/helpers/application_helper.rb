module ApplicationHelper
  def app_name
    "FRC862 Hours"
  end

  def live_info
    info = Rails.cache.fetch("live_info") { ["Default Message"] }
    info.map { |i| "<div>#{i}</div>" }.join.html_safe
  end
end

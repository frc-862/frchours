def push_info(msg)
  Pusher['frc862'].trigger('info', { info: msg })

  msgs = Rails.cache.read("live_info")
  msgs = msgs.unshift(msg)[0..7]
  Rails.cache.write("live_info", msgs) 
end

def push_info(msg)
  Pusher['fcr862'].trigger('info', { info: msg })
end

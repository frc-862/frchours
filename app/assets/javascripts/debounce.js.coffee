if !window.pth?
  window.pth = {}

window.pth.debounce = (func, threshold, execAsap) ->
  timeout = null
  (args...) ->
    obj = this
    delayed = ->
      func.apply(obj, args) unless execAsap
      timeout = null
    if timeout
      clearTimeout(timeout)
    else if (execAsap)
      func.apply(obj, args)
    timeout = setTimeout delayed, threshold || 200

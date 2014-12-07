# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $("body.checkin")
    #console.log "checking in"
    #console.log $("body.checkin.index input#attendance_student_id")

    #$("body.checkin.index input#attendance_student_id").focus()
    #console.log $("body.checkin.index input#attendance_student_id").focus()
    #console.log "focus set"

    $("body.checkin.index input#attendance_student_id").on "keyup", ->
      val = $(this).val()
      #console.log val

      if val.match(/\d{9,}/)
        $("form").submit()



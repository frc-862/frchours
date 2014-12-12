# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("body.reports.daily input#report_date").on "input", pth.debounce ->
    window.location = window.location.pathname + "?date=#{$(this).val()}" 
    

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.seat').click ->
    console.log("HEJSAN")
  $('.seat').hover(
    (ev) -> $(this).css background: "#00b2ff" #blue
    (ev) -> $(this).css background: "#3bff66" #green
  )

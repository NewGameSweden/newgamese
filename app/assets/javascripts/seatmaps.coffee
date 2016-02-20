# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.seat').click ->
    $(this).parent().parent().find('.seat').removeClass('selected')
    $(this).addClass('selected')
    $("#name").html('seats/' + $(this).attr("id").split('-')[1])
    $.ajax(
      url: '/seats/' + $(this).attr("id").split('-')[1] + '.json',
      contentType: "application/json"
      ).done (html) ->
        console.log(html)
  $('.seat').hover(
    (ev) -> $(this).addClass('hover')
    (ev) -> $(this).removeClass('hover')
  )

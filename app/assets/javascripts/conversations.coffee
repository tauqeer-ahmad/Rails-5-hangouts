# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
bind_slim_scroll = ->
  $('.slimscroll').slimScroll
    height: '400px'

  $('.slimscroll').scrollTop($('.slimscroll')[0].scrollHeight)

$(document).on 'turbolinks:load', (event) ->
  bind_slim_scroll()

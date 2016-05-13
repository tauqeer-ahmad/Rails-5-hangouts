# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.slimscroll').slimScroll
    height: '400px'

  $('.slimscroll').scrollTop($('.slimscroll')[0].scrollHeight) if $('.slimscroll').length > 0

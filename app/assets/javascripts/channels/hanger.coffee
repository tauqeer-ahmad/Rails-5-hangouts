App.hanger = App.cable.subscriptions.create "HangerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#hanger-#{data['conversation_id']}").append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message, conversation_id) ->
    @perform 'speak', message: message, conversation_id: conversation_id

$(document).on 'keypress', '[data-behavior~=hanger_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.hanger.speak event.target.value, $(this).attr('data-rip')
    event.target.value = ""
    event.preventDefault()

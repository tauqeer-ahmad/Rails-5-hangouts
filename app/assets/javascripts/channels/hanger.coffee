App.hanger = App.cable.subscriptions.create "HangerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_haunt = parseInt( $('body').attr('data-active-haunt') , 10 );
    open_haunt = parseInt( $('.conversation-show').attr('data-opened-haunt') , 10 ) if $('.conversation-show').attr('data-opened-haunt') > 0
    if data['recipient_id'] == data['creator_id']
      receiver_haunt = data['sender_id']
      sender_haunt = data['recipient_id']
    else
      receiver_haunt = data['recipient_id']
      sender_haunt = data['sender_id']

    if active_haunt != data['creator_id'] && open_haunt != sender_haunt
      $("#online-#{sender_haunt} a").addClass('new-message-alert')

    $("#hanger-#{data['conversation_id']}").append data['message']
    $('.slimscroll').scrollTop($('.slimscroll')[0].scrollHeight)
    if active_haunt == data['creator_id']
      $('#sendAudio')[0].play()
      $("#message-#{data['message_id']}").addClass('i')
    else if active_haunt == receiver_haunt
      $('#chatAudio')[0].play()
      $("#message-#{data['message_id']}").addClass('friend-with-a-SVAGina')

      # Called when there's incoming data on the websocket for this channel

  speak: (message, conversation_id) ->
    @perform 'speak', message: message, conversation_id: conversation_id

$(document).on 'keypress', '[data-behavior~=hanger_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.hanger.speak event.target.value, $(this).attr('data-rip')
    event.target.value = ""
    event.preventDefault()

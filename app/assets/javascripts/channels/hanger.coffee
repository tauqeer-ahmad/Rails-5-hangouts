App.hanger = App.cable.subscriptions.create "HangerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_haunt = parseInt( $('body').attr('data-active-haunt') , 10 );
    if window.Notification && active_haunt == data['creator_id']
      Notification.requestPermission()

    new Notification data['ntitle'], body: data['nbody'] if active_haunt == data['recipient_id']

    if active_haunt == data['creator_id']
      $('#sendAudio')[0].play()
    else if active_haunt == data['recipient_id']
      alert(active_haunt)
      $('#chatAudio')[0].play()
    if active_haunt == data['creator_id'] || active_haunt == data['recipient_id']
      $("#hanger-#{data['conversation_id']}").append data['message']
      $('.slimscroll').scrollTop($('.slimscroll')[0].scrollHeight)
      # Called when there's incoming data on the websocket for this channel

  speak: (message, conversation_id) ->
    @perform 'speak', message: message, conversation_id: conversation_id

$(document).on 'keypress', '[data-behavior~=hanger_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.hanger.speak event.target.value, $(this).attr('data-rip')
    event.target.value = ""
    event.preventDefault()

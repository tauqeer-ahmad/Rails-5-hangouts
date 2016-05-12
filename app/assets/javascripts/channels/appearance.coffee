App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    App.appearance.appear()

  disconnected: ->
     @away()

  received: (data) ->
    $(document).ready ->
      $("#online-#{data['current_haunt']}").replaceWith(data['online'])

  away: ->
    @perform 'away'

  appear: ->
    @perform 'appear'

App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    App.appearance.appear()

  disconnected: ->
     @away()

  received: (data) ->
    console.log data['appearances']
    $(document).ready ->
      document.getElementById('appearances').innerHTML = data['appearances']

  away: ->
    @perform 'away'

  appear: ->
    @perform 'appear'

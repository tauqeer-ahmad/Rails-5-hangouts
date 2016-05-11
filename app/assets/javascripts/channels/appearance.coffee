App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    App.appearance.appear()

  disconnected: ->
     @away()

  received: (data) ->
    $(document).ready ->
      document.getElementById('appearances').innerHTML = data['appearances'] if document.getElementById('appearances') != null

  away: ->
    @perform 'away'

  appear: ->
    @perform 'appear'

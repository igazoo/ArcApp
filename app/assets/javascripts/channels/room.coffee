App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
      $('#posts').append("<p>"+data["message"]+"</p>");
      # 投稿を追加
    # Called when there's incoming data on the websocket for this channel

  speak: (message)->
      @perform 'speak', message: message

jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return キーのキーコードが13
    App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')]
    event.target.value = ''
    event.preventDefault()

App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    # Append the rendered message content to the div with "message-append" id
    $('#message-append').prepend data.message_content
    $('#message_content').val('')
    scroll_top()

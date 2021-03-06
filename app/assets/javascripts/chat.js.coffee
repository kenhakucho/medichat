class @ChatClass
  constructor: (url, useWebsocket) ->
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @bindEvents()

  bindEvents: () =>
    $('#send').on 'click', @sendMessage
    @dispatcher.bind 'new_message', @receiveMessage

  sendMessage: (event) =>
    user_name = $('#username').val()
    msg_body = $('#msgbody').val()
    @dispatcher.trigger 'new_message', { name: user_name , body: msg_body }
　　$('#msgbody').val('')

  receiveMessage: (message) =>
    $('#chat').append "#{message.name} : #{message.body}<br/>"

$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)

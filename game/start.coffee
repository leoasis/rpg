socket_io  = require 'socket.io'

module.exports.start = (app) ->
  socket = socket_io.listen app
  socket.on 'connection', (client) ->
    client.on 'message', (message) ->
      client.send message
    client.on 'disconnect', ->
      client.broadcast JSON.stringify([['disconnect', client.sessionId]])

express = require 'express'
socket_io  = require 'socket.io'

app = express.createServer()

app.configure ->
  app.set 'view options', { layout: false }

app.get '/', (req, res) ->
  res.render 'index.ejs'

app.listen 3000

socket = socket_io.listen app
socket.on 'connection', (client) ->
  client.on 'message', (message) ->
    client.send message
  client.on 'disconnect', ->
    client.broadcast JSON.stringify([['disconnect', client.sessionId]])


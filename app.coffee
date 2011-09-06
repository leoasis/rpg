site = require './site/start'
game = require './game/server/start'

app = require('express').createServer()
io = require('socket.io').listen app

site.start app
game.start io

port = process.env.PORT || 3000
app.listen port

console.log "Application started. Listening on port #{port}"
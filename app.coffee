site = require './site/start'
game = require './game/start'

app = require('express').createServer()
io = require('socket.io').listen app

site.start app
game.start io

app.listen process.env.PORT || 3000;

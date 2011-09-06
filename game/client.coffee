Loop = require './loop'

exports.begin = (canvas) ->
  context = canvas.getContext '2d'
  
  socket = io.connect 'http://localhost'
  socket.on 'update', (data) ->
    console.log data
    
  l = new Loop
  l.on 'tick', ->     
  l.start()
  
  keys = 
    left: 37
    up: 38
    right: 39
    down: 40
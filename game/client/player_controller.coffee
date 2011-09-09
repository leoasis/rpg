keys = 
    37: 'left'
    38: 'up'
    39: 'right'
    40: 'down'

class PlayerController  
  constructor: ($canvas, socket) ->    
    @socket = socket
    
    $canvas.keydown (event) ->      
      event.preventDefault()
      socket.emit 'move', keys[event.which]
        
      
exports.PlayerController = PlayerController
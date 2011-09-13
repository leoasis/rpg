keys = 
  37: 'left'
  38: 'up'
  39: 'right'
  40: 'down'

class ControllerComponent  
  init: ->    
    @canvas.keydown (event) =>      
      event.preventDefault()
      @socket.emit 'move', keys[event.which] if keys[event.which]?
        
      
exports.ControllerComponent = ControllerComponent
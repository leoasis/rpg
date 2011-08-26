WorldObject = require './world_object'

class Player extends WorldObject  
  constructor: ->
    super
    @interval 'move', 10

  moving: ->
    @moveInterval.inProgress()
    
  move: (direction) ->
    return if @moving()
    @map.move this, direction
    @moveInterval.start()
    console.log "I'm player #{@id} and I moved #{direction} to x:#{@position.x} y:#{@position.y}"
    this
    
module.exports = Player

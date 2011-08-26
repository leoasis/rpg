WorldObject = require './world_object'
Player = require './player'

class AIObject extends WorldObject
  constructor: ->
    super
    @interval 'move', 20
    @on 'placed', (map) =>
      map.on 'object moved', (object) => @_watchFor object
    
  moving: ->
    @moveInterval.inProgress()
    
  _watchFor: (object) ->
    @chasing = @_closest @chasing, object
    @moveInterval.next => @_chase object
        
  _chase: (object) ->    
    if @position.x > object.position.x 
      direction = 'left'
    else if @position.x < object.position.x
      direction = 'right'
    else if @position.y > object.position.y
      direction = 'down'
    else if @position.y < object.position.y
      direction = 'up'
    else return
    @map.move this, direction
    @moveInterval.next => @_chase object
    console.log "AIObject moved to x:#{@position.x} y:#{@position.y}, chasing Player #{@chasing.id}"
    
  _closest: (objA, objB) ->
    objB
    

module.exports = AIObject

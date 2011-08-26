events = require 'events'
Position = require './position'

class Map extends events.EventEmitter
  constructor: (number) ->
    @number = number
    
  place: (object, x, y) ->
    object.map = this
    position = new Position x, y
    object.position = position
    object.emit 'placed', this
    
  move: (object, direction) ->
    newPos = object.position[direction]()
    object.position = newPos
    @emit 'object moved', object
    
module.exports = Map

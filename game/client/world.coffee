Map = require './map'

class World
  constructor: ->
    @objects = []
    @map = new Map
    
  spin: ->
    for object in @objects
      object.update()
    
  spawn: (type, args...) ->
    object = new type(@map, args...)
    @objects.push object
    object

module.exports = World

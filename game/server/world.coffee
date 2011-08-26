Map = require './map'

class World
  constructor: ->
    @maps = []
    @objects = []
    @maps[1] = new Map 1
    
  spin: ->
    for object in @objects
      object.update()
      
  spawn: (type, args) ->
    object = new type(args.id)
    @maps[args.map].place object, args.x, args.y
    @objects.push object
    object
    
module.exports = World

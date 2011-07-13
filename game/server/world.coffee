class World
  constructor: ->
    @objects = []
    
  spin: ->
    for object in @objects
      object.update()
    
  spawn: (type, args...) ->
    object = new type(args)
    @objects.push object
    object

module.exports = World

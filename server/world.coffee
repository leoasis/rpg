class World
  constructor: ->
    @objects = []
    
  tick: ->
    for object in @objects
      object.update()
    
  spawn: (type) ->
    object = new type
    @objects.push object
    object

module.exports = World

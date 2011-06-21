vows = require 'vows'
assert = require 'assert'
World = require '../../server/world'
WorldObject = require '../../server/world_object'
specs = vows.describe 'World'

specs.addBatch
  
  'with a new world':
    topic: ->
      new World
      
    'when we span an object and call tick':
      topic: (world) ->        
        object = world.spawn WorldObject        
        object.update = -> 
          object.updated = true
        world.tick()
        object
        
      'it should call update on object': (object) ->
        assert.isTrue object.updated
      
.export module

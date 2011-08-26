vows = require 'vows'
assert = require 'assert'
World = require '../../server/world'
WorldObject = require '../../server/world_object'
specs = vows.describe 'World tests'

specs.addBatch
  
  'with a new world':
    topic: -> new World
      
    'when we span an object and spin the world':
      topic: (world) ->        
        object = world.spawn WorldObject        
        object.on 'updated', @callback
        world.spin()
        undefined
        
      'it should call update on object': (object) ->
      
.export module, error: false

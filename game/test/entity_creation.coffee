vows = require 'vows'
assert = require 'assert'
Entity = require '../entity'

exports.suite = vows.describe('Creating an entity').addBatch

  'with the entity types definition loaded':
    topic: ->
      Entity.loadTypes
        'Entity 1':
          position: {}
          map: {}
          physics:
            speed: 20
            width:
              x: 1
              y: 1
      null
    
    'with a description of the entity having a component':
      topic: ->
        type: 
          'Entity 1'
        position:
          x: 1
          y: 3
        map:
          no: 1
      
      'when I create the entity':
        topic: (description) ->
          Entity.createFrom description
        
        'it should have a type': (entity) ->
          assert.areEqual 'Entity 1', entity.type

        'it should have the defined components': (entity) ->
          assert.isObject entity.position
          assert.isObject entity.map
          assert.isObject entity.physics

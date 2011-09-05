vows = require 'vows'
assert = require 'assert'
Loop = require '../loop'
Entity = require '../entity'

l = new Loop
l.start()

exports.specs = vows.describe('Physics component behavior').addBatch

  "with an entity with a physics component":
    topic: ->
      Entity.loadTypes
        "Entity 1":
          position: {}
          map: {}
          physics:
            speed: 20
            width:
              x: 1
              y: 1
              
      entity = Entity.createFrom
        type:
          "Entity 1"
        position:
          x: 1
          y: 1
        map:
          no: 1
          
      l.on 'tick', -> entity.update()
      entity      
      
    "when moving right":
      topic: (entity) ->
        entity.physics.move 'right'
        entity
        
      "it should move 1 tile right": (entity) ->
        assert.equal 2, entity.position.x
        
      "and during <speed> cycles":
        topic: (entity) ->
          ticks = 0
          l.on 'tick', => 
            ticks++
            @callback null, entity if ticks == 5
          undefined
          
        "it should ignore move commands": (err, entity) ->
          assert.isTrue entity.physics.moving
        
      "and after <speed> cycles":
        topic: (entity) ->
          ticks = 0
          l.on 'tick', => 
            ticks++
            @callback null, entity if ticks == 20
          undefined
          
        "it should be ready to move again": (err, entity) ->
          assert.isFalse entity.physics.moving

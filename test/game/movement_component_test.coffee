vows = require 'vows'
assert = require 'assert'
Loop = require '../../game/loop'
{Entity} = require '../../game/entity'
EntityFactory = require '../../game/entity_factory'
ComponentFactory = require '../../game/component_factory'
{MovementComponent} = require '../../game/movement_component'

l = new Loop
l.start()

exports.specs = vows.describe('Basic movement').addBatch

  "with an entity with a physics component":
    topic: ->
      ComponentFactory.register
        movement: MovementComponent
        
      EntityFactory.for Entity
      EntityFactory.loadTypes
        "Entity 1":
          position: {}
          map: {}
          movement:
            speed: 20            
              
      entity = EntityFactory.create
        type:
          "Entity 1"
        position:
          x: 1
          y: 1
        map:
          no: 1
          
      l.on 'tick', -> entity.tick()
      entity      
      
    "when moving right":
      topic: (entity) ->
        entity.movement.move 'right'
        entity
        
      "it should move 1 tile right": (entity) ->
        assert.equal entity.position.x, 2
        
      "and during <speed> cycles":
        topic: (entity) ->
          ticks = 0
          l.on 'tick', => 
            ticks++
            @callback null, entity if ticks == 5
          undefined
          
        "it should ignore move commands": (err, entity) ->
          assert.isTrue entity.movement.moving
        
      "and after <speed> cycles":
        topic: (entity) ->
          ticks = 0
          l.on 'tick', => 
            ticks++
            @callback null, entity if ticks == 20
          undefined
          
        "it should be ready to move again": (err, entity) ->
          assert.isFalse entity.movement.moving 
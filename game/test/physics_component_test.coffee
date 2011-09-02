vows = require 'vows'
assert = require 'assert'
Loop = require '../loop'

world = new World

exports.specs = vows.describe('Player movement behavior').addBatch

  "with an entity with position and physics components created":
    topic: ->
      l = new Loop
      l.on 'tick', -> world.spin()
      l.start()
      world
     
    'and a new player in the world':
      topic: (world) ->
        world.spawn Player, map: 1, x: 1, y: 1
        
      'when moving right':
        topic: (player) ->
          player.move 'right'
      
        'after moving completed':
          topic: (player) ->
            player.on 'updated', @callback
            undefined
      
          'should cause the player to move one tile right': (player) ->
      
.export module, error: false

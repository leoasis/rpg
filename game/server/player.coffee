WorldObject = require './world_object'

class Player extends WorldObject
  constructor: (position) ->
    @position = position
    
  _update: ->
    switch @curr_action
      when 'right' then @position.x += 1
      when 'left'  then @position.x -= 1
      when 'up'    then @position.y += 1
      when 'down'  then @position.y -= 1
  
  move: (direction) ->
    @curr_action = direction
    this
    
module.exports = Player

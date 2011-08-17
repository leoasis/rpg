WorldObject = require './world_object'

class Player extends WorldObject
  constructor: (map) ->
    @map = map
    @position = x: 1, y: 1  
  
  _update: ->
  
  getPosition: -> @position
  
  move: (direction) ->
    switch direction
      when 'left' then new_pos = x: @position.x-1, y: @position.y
      when 'up' then new_pos = x: @position.x, y: @position.y+1
      when 'right' then new_pos = x: @position.x+1, y: @position.y
      when 'down' then new_pos = x: @position.x, y: @position.y-1
    @position = @map.moveTo new_pos, this
    
module.exports = Player


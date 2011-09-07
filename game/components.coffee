extend = require './extend'

class PositionComponent
  serialize: ->
    x: @x
    y: @y
    
class MapComponent
  serialize: ->
    no: @no
    
class PhysicsComponent
  directions = 
    up: 
      x: 0, y: 1
    down: 
      x: 0, y: -1
    right: 
      x: 1, y: 0
    left: 
      x: -1, y: 0
    
  move: (direction) ->
    return if @moving
    @moving = yes
    @progress = 0
    velocity = directions[direction]
    @owner.position.x += velocity.x
    @owner.position.y += velocity.y
  
  update: ->
    @progress++ if @moving
    if @speed == @progress
      @moving = no
      @progress = null
      
  serialize: ->
    speed: @speed
    width:
      x: @width.x
      y: @width.y
    
exports.oneOf = (name, properties) ->  
  componentClassName = "#{name[0].toUpperCase() + name.slice(1)}Component"
  if eval "typeof #{componentClassName} === 'function'"
    componentClass = eval componentClassName
    component = new componentClass
  else
    component = {}
  component.name = name
  extend component, properties  

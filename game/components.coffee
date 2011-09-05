extend = require './extend'

class Component  
  constructor: ->
    
class PositionComponent extends Component    
  constructor: ->
    
class MapComponent extends Component    
  constructor: ->
    
class OrientationComponent extends Component    
  constructor: ->
  
class PhysicsComponent extends Component
  constructor: ->

  move: (direction) ->
    

exports.oneOf = (name, entity, properties) ->  
  componentClassName = "#{name[0].toUpperCase() + name.slice(1)}Component"
  componentClass = eval componentClassName
  component = new componentClass
  component.owner = entity
  component.name = name
  extend component, properties  

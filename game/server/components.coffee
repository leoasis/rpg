components = []

exports.oneOf: (name, entity, properties) ->
  component = new components[name]
  component.owner = entity
  component.name = name
  for propName, value in properties
    component[propName] = value

class Component  

components.position =
  class PositionComponent extends Component    

components.map = 
  class MapComponent extends Component    

components.orientation =
  class OrientationComponent extends Component    

components.physics =
  class PhysicsComponent extends Component
    constructor: ->      
      @requires 'orientation', 'position'
    

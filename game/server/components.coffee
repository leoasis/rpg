class Component
  constructor: (owner, name) ->
    @owner = owner
    @name = name
    @owner[name] = this

class PositionComponent extends Component
  constructor: (owner) ->
    super owner, 'position'    
    @x = 0
    @y = 0

class MapComponent extends Component
  constructor: (owner) ->
    super owner, 'map'
    @no = 1
    
class OrientationComponent extends Component
  constructor: (owner) ->
    super owner, 'orientation'
    @direction = 'down'
    
class PhysicsComponent extends Component
  constructor: (owner) ->
    super owner, 'physics'
    @speed = 0
    @width = x: 1, y: 1
    @requires 'orientation', 'position'
    

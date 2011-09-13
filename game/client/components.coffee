{MapComponent} = require '../map_component'
{PositionComponent} = require '../position_component'
{PhysicsComponent} = require '../physics_component'
{ControllerComponent} = require './controller_component'

module.exports = 
  map: MapComponent
  position: PositionComponent
  physics: PhysicsComponent
  controller: ControllerComponent
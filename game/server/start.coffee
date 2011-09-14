Loop = require '../loop'
{Entity} = require './entity'
EntityFactory = require '../entity_factory'
ComponentFactory = require '../component_factory'
components = require './components'
entityTypes = require './entity_types'
{ClientUpdateSubsystem} = require './client_update_subsystem'

exports.start = (io) ->
  io.set('log level', 1);
  
  ComponentFactory.register components
  EntityFactory.for Entity
  EntityFactory.loadTypes entityTypes

  entities = []
  subsystems = {}
    
  subsystems.clientUpdate = new ClientUpdateSubsystem entities
  
  gameLoop = new Loop
  gameLoop.on 'tick', ->
    entity.tick() for entity in entities
    subsystem.tick() for name, subsystem of subsystems
    undefined
  gameLoop.start()
  
  nextId = 1
  io.sockets.on 'connection', (socket) ->    
    entity = EntityFactory.create
      id: nextId++
      type: "Player"
      position:
        x: 1
        y: 1
      map:
        no: 1
        
    entity.clientUpdate.socket = socket
    entities.push entity
    subsystems.clientUpdate.start entity
    
    socket.on 'move', (direction) ->
      entity.movement.move direction
      
    socket.on 'disconnect', ->
      index = entities.indexOf entity
      entities.splice index, 1 if index isnt -1
      entity.destroy()     
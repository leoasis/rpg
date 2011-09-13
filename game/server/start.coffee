Loop = require '../loop'
{Entity} = require './entity'
EntityFactory = require '../entity_factory'
ComponentFactory = require '../component_factory'
components = require './components'
{ClientUpdateSubsystem} = require './client_update_subsystem'

exports.start = (io) ->
  io.set('log level', 1);
  ComponentFactory.register components
  
  EntityFactory.for Entity
  EntityFactory.loadTypes
    "Player":
      position: {}
      map: {}
      physics:
        speed: 10
        width:
          x: 1
          y: 1
      clientUpdate: {}
      
  gameLoop = new Loop
  entities = []
  subsystems = []
  gameLoop.on 'tick', ->
    entity.update() for entity in entities
    subsystem.update() for subsystem in subsystems
    undefined
  
  clientUpdate = new ClientUpdateSubsystem entities
  subsystems.push clientUpdate
  
  gameLoop.start()
  nextId = 1
  i = 1
  io.sockets.on 'connection', (socket) ->    
    entity = EntityFactory.create 
      type: "Player"
      position:
        x: 1
        y: i++
      map:
        no: 1
        
    entity.id = nextId++
    entity.clientUpdate.socket = socket
    entities.push entity
    clientUpdate.start entity
    
    socket.on 'move', (direction) ->
      entity.physics.move direction
      
    socket.on 'disconnect', ->
      index = entities.indexOf entity
      entities.splice index, 1 if index isnt -1
      entity.destroy()     
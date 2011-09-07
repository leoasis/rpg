Loop = require '../loop'
Entity = require '../entity'
{ClientUpdateSubsystem} = require '../subsystems'

Entity.loadTypes
  "Player":
    position: {}
    map: {}
    physics:
      speed: 20
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

exports.start = (io) ->
  subsystems.push new ClientUpdateSubsystem(entities)
  
  gameLoop.start()
  i = 1
  io.sockets.on 'connection', (socket) ->    
    entity = Entity.createFrom 
      type: "Player"
      position:
        x: 1
        y: i++
      map:
        no: 1
      
    entity.clientUpdate.socket = socket    
    subsystem.add entity for subsystem in subsystems
    entities.push entity
    
    socket.emit 'created', entity.serialize()
    
    socket.on 'disconnect', ->
      index = entities.indexOf entity
      entities.splice index, 1 if index isnt -1
      entity.destroy()     
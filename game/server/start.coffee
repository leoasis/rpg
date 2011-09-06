Loop = require '../loop'
Entity = require '../entity'

Entity.loadTypes
  "Player":
    position: {}
    map: {}
    physics:
      speed: 20
      width:
        x: 1
        y: 1
    updatesClient: {}
    
gameLoop = new Loop
entities = []
subsystems = []

gameLoop.on 'tick', ->
  entity.update() for entity in entities
  subsystem.update() for subsystem in subsystems
  undefined

exports.start = (io) ->
  gameLoop.start()
  subsystem.start() for subsystem in subsystems
  
  io.sockets.on 'connection', (socket) ->    
    entity = Entity.createFrom 
      type: "Player"
      position:
        x: 1
        y: 3
      map:
        no: 1
    
    ###
    Emitting to socket should be a subsystem, the component referencing this should have the socket
    associated with the player.
    This subsystem could run at a certain rate and send updates to the clients.
    This update should send entity updates from the same map as the client player's.
    ###
    entity.updatesClient.socket = socket
    entities.push entity
    
    socket.on 'disconnect', ->
      index = entities.indexOf entity
      entities.splice index, 1 if index isnt -1
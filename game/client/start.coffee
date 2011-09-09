Loop = require '../loop'
{Entity} = require '../entity'
EntityFactory = require '../entity_factory'
{RenderSubsystem} = require './render_subsystem'
{SynchronizationSubsystem} = require './synchronization_subsystem'
{PlayerController} = require './player_controller'

exports.begin = (canvas) ->
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
      render: {}

  gameLoop = new Loop
  entities = {}
  subsystems = []
  playerId = 0
  gameLoop.on 'tick', ->
    entity.update() for id, entity of entities
    subsystem.update() for subsystem in subsystems
    undefined
    
  subsystems.push new RenderSubsystem entities, canvas
  sync = new SynchronizationSubsystem entities, EntityFactory
  
  gameLoop.start()
  
  socket = io.connect()
  socket.on 'start', (data) ->
    playerId = sync.start data
    console.log "I'm player #{playerId}"
    entities[playerId].controller = new PlayerController $(canvas), socket
    
  socket.on 'update', (data) ->
    sync.update data
  
  
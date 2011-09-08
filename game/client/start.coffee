Loop = require '../loop'
Entity = require '../entity'
{RenderSubsystem} = require './render_subsystem'
{SynchronizationSubsystem} = require './synchronization_subsystem'

exports.begin = (canvas) ->
  Entity.loadTypes
    "Player":
      position: {}
      map: {}
      physics:
        speed: 20
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
  sync = new SynchronizationSubsystem entities
  
  gameLoop.start()
  
  socket = io.connect 'http://localhost'
  socket.on 'start', (data) ->
    playerId = sync.start data
    console.log "I'm player #{playerId}"
    
  socket.on 'update', (data) ->
    sync.update data
  
  keys = 
    left: 37
    up: 38
    right: 39
    down: 40
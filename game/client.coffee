Loop = require './loop'
Entity = require './entity'
{RenderSubsystem, SynchronizationSubsystem} = require '../subsystems'

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
entities = []
subsystems = []

gameLoop.on 'tick', ->
  entity.update() for entity in entities
  subsystem.update() for subsystem in subsystems
  undefined
        
exports.begin = (canvas) ->
  context = canvas.getContext '2d'
  subsystems.push new RenderSubsystem canvas, context
  
  gameLoop.start()
  
  synchronizationSubsystem = new SynchronizationSubsystem entities
  
  socket = io.connect 'http://localhost'
  socket.on 'created', (data) ->
    entity = Entity.createFrom data
    entities.push entity
    subsystem.add entity for subsystem in subsystems
    
  socket.on 'update', (data) ->
    synchronizationSubsystem.update data
  
  keys = 
    left: 37
    up: 38
    right: 39
    down: 40
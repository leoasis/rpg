Loop = require '../loop'
{Entity} = require './entity'
EntityFactory = require '../entity_factory'
ComponentFactory = require '../component_factory'
components = require './components'
entityTypes = require './entity_types'
{RenderSubsystem} = require './render_subsystem'
{SynchronizationSubsystem} = require './synchronization_subsystem'

exports.begin = (canvas) ->
  ComponentFactory.register components
  EntityFactory.for Entity
  EntityFactory.loadTypes entityTypes
  
  entities = {}
  subsystems = {}
  playerId = 0
  
  subsystems.render = new RenderSubsystem entities, canvas
  sync = new SynchronizationSubsystem entities, EntityFactory
  
  gameLoop = new Loop
  gameLoop.on 'tick', ->
    entity.tick() for id, entity of entities
    subsystem.tick() for name, subsystem of subsystems
    undefined
  gameLoop.start()
  
  socket = io.connect()
  socket.on 'start', (data) ->
    data[data.me].controller = { socket, canvas: $ canvas }
    playerId = sync.start data
    subsystems.render.player = entities[playerId]
    console.log "I'm player #{playerId}"   
    
  socket.on 'update', (data) ->
    sync.update data
  
  
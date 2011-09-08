class ClientUpdateSubsystem
  constructor: (entities) ->    
    @ticks = 0
    @entities = entities
  
  updateTicksRate: 10
  
  start: (entity) ->
    state = {}
    for entity in @entities
      state[entity.id] = entity.serialize()
    state.me = entity.id
    entity.clientUpdate.socket.emit 'start', state
  
  update: ->
    @ticks++
    return if @ticks isnt @updateTicksRate
    @ticks = 0
    
    state = {}
    for entity in @entities
      data = entity.serialize()      
      state[entity.id] = data
    
    for entity in @entities when entity.clientUpdate?
      entity.clientUpdate.socket.emit 'update', state
    
exports.ClientUpdateSubsystem = ClientUpdateSubsystem
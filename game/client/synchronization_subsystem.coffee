Entity = require '../entity'

class SynchronizationSubsystem
  constructor: (entities) ->
    @entities = entities
    
  start: (data) ->
    @entities[id] = Entity.createFrom entityData for id, entityData of data
    data.me
    
  update: (data) ->
    delete @entities[key] for key of @entities    
    for id, entityData of data
      @entities[id] = Entity.createFrom entityData    
exports.SynchronizationSubsystem = SynchronizationSubsystem
class SynchronizationSubsystem
  constructor: (entities, factory) ->
    @entities = entities
    @factory = factory
    
  start: (data) ->
    @entities[id] = @factory.create entityData for id, entityData of data
    data.me
    
  update: (data) ->
    delete @entities[key] for key of @entities    
    for id, entityData of data
      @entities[id] = @factory.create entityData    
exports.SynchronizationSubsystem = SynchronizationSubsystem
class SynchronizationSubsystem
  constructor: (entities, factory) ->
    @entities = entities
    @factory = factory
    
  start: (data) ->
    for id, entityData of data when typeof entityData is 'object'     
      @entities[id] = @factory.create entityData    
    data.me
    
  update: (data) ->
    delete @entities[key] for key of @entities    
    for id, entityData of data
      @entities[id] = @factory.create entityData    
exports.SynchronizationSubsystem = SynchronizationSubsystem
class SynchronizationSubsystem
  constructor: (entities, factory) ->
    @entities = entities
    @factory = factory
    
  start: (data) ->
    for id, entityData of data when typeof entityData is 'object'     
      @entities[id] = @factory.create entityData
    data.me
    
  update: (data) ->
    #call update for entities already existing
    @entities[id].update data[id] for id of data when @entities[id]?

    #create entities not existing
    @entities[id] = @factory.create entityData for id, entityData of data when not @entities[id]?
      
    #remove entities that are not in update packet
    delete @entities[id] for id of @entities when not data[id]?
    
exports.SynchronizationSubsystem = SynchronizationSubsystem
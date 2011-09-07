class ComponentSubsystem
  constructor: (name)->
    @components = []
    @name = name
  
  add: (entity) ->
    @components.push entity[@name]
    entity.once 'destroyed', => @_remove entity[@name]

  _remove: (component) ->
    index = @components.indexOf component
    @components.splice index, 1 if index isnt -1

class ClientUpdateSubsystem extends ComponentSubsystem
  constructor: (entities) ->
    super 'clientUpdate'
    @ticks = 0
    @entities = entities
  
  updateTicksRate: 10
  
  update: ->
    @ticks++
    return if @ticks isnt @updateTicksRate
    @ticks = 0
    
    worldState = (entity.serialize() for entity in @entities)
    
    for component in @components
      component.socket.emit 'update', worldState
    
exports.ClientUpdateSubsystem = ClientUpdateSubsystem

class RenderSubsystem extends ComponentSubsystem
  constructor: (canvas, context) ->
    super 'render'
    @ticks = 0
    @canvas = canvas
    @context = context
  
  updateTicksRate: 1
  
  update: ->
    @ticks++
    return if @ticks isnt @updateTicksRate
    @ticks = 0    
    @context.clearRect 0, 0, @canvas.width, @canvas.height
    
    for component in @components
      x = component.owner.position.x
      y = component.owner.position.y
      @context.fillRect x*10, y*10, 10, 10
  
exports.RenderSubsystem = RenderSubsystem

class SynchronizationSubsystem
  constructor: (entities) ->
    @entities = entities
    
  update: ->
  
exports.SynchronizationSubsystem = SynchronizationSubsystem
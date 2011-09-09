class RenderSubsystem
  constructor: (entities, canvas) ->    
    @entities = entities
    @ticks = 0
    @canvas = canvas
    @context = canvas.getContext '2d'    
    
  updateTicksRate: 1
  
  update: ->
    @ticks++
    return if @ticks isnt @updateTicksRate
    @ticks = 0    
    @context.clearRect 0, 0, @canvas.width, @canvas.height
        
    for id, entity of @entities when entity.render?
      x = entity.position.x
      y = entity.position.y
      @context.fillRect x*10, y*10, 10, 10
  
exports.RenderSubsystem = RenderSubsystem
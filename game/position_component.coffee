class PositionComponent
  isSameAs: (otherPosition) ->
    @x is otherPosition.x and @y is otherPosition.y
  
  serialize: ->
    x: @x
    y: @y
    
exports.PositionComponent = PositionComponent
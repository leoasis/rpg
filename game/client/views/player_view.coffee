class PlayerView
  constructor: (context, player) ->
    @context = context
    @player = player
    
  draw: ->
    inc_x = @context.canvas.width / 40
    inc_y = @context.canvas.height / 40
    position = @player.getPosition()
    position = x: position.x * inc_x, y: @context.canvas.height - position.y * inc_y
    @context.fillRect position.x, position.y, 20, 20
    
module.exports = PlayerView

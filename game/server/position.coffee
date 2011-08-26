class Position
  constructor: (x, y) ->
    @x = x
    @y = y

  left: -> new Position @x-1, @y 
  right: -> new Position @x+1, @y
  up: -> new Position @x, @y+1
  down: -> new Position @x, @y-1

module.exports = Position

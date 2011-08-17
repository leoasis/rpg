Map = require './map'
World = require './world'
Player = require './player'
PlayerView = require './views/player_view'
Loop = require './loop'

module.exports.begin = (canvas) ->
  context = canvas.getContext '2d'

  world = new World
  
  player = world.spawn Player, map
  player_view = new PlayerView context, player
    
  l = new Loop
  l.on 'tick', -> 
    world.spin()
    context.clearRect 0, 0, canvas.width, canvas.height
    player_view.draw()
  l.start()
  
  $('body').keydown (event) ->
    switch event.which
      when 37 then player.move 'left'
      when 38 then player.move 'up'
      when 39 then player.move 'right'
      when 40 then player.move 'down'

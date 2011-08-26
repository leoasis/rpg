events = require 'events'
Loop = require '../common/loop'
World = require './world'
Player = require './player'
AIObject = require './ai_object'
PlayerController = require './player_controller'
Position = require './position'

gameLoop = new Loop
world = new World
gameLoop.on 'tick', -> world.spin()
player = world.spawn Player, map: 1, x:1, y:1, id:1
aiObj = world.spawn AIObject, map: 1, x: 4, y: 4, id: 1
messageHandler = new events.EventEmitter
controller = new PlayerController messageHandler
controller.control player

gameLoop.start()

messageHandler.emit 'player moved', 1, 'up'
messageHandler.emit 'player moved', 1, 'down'

setTimeout ->
  messageHandler.emit 'player moved', 1, 'down'
, 2000

class PlayerController
  constructor: (messageHandler) ->
    @_players = []
    @_messageHandler = messageHandler
    @_messageHandler.on 'player moved', (playerId, direction) => @move playerId, direction
    
    
  control: (player) ->
    @_players[player.id] = player
    
  move: (playerId, direction) ->
    player = @_players[playerId]
    
    if player.moving()
      console.log "Player #{player.id} is still moving!"
      return
      
    player.move direction

module.exports = PlayerController

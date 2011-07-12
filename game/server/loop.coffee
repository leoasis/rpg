class Loop
  constructor: (handler) ->
    @handler = handler
  
  interval: 50
    
  start: ->
    @stopped = false
    @_nextTick()
    
  _tick: ->
    return if @stopped
    @handler.tick()
    @_nextTick()
  
  _nextTick: ->
    setTimeout (=> @_tick()), @interval    
    
  stop: ->    
    @stopped = true
  
module.exports = Loop

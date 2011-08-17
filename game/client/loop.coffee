events = require 'events'

class Loop extends events.EventEmitter
  
  interval: 50
    
  start: ->
    @stopped = false
    @_nextTick()
    
  _tick: ->
    return if @stopped
    @emit 'tick'
    @_nextTick()
  
  _nextTick: ->
    setTimeout (=> @_tick()), @interval    
    
  stop: ->    
    @stopped = true
  
module.exports = Loop

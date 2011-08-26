events = require 'events'

class Loop extends events.EventEmitter
  
  interval: 50
    
  start: ->
    @stopped = false
    @_tick()
    
  _tick: ->
    return if @stopped
    @emit 'tick'
    setTimeout (=> @_tick()), @interval
    
  stop: ->    
    @stopped = true
  
module.exports = Loop

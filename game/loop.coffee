{EventEmitter} = require 'events'

class Loop extends EventEmitter
  
  ticksPerSecond: 50
    
  start: ->
    return if @timer
    last = Date.now()
    tickRate = 1000 / @ticksPerSecond
    @timer = setInterval =>
      now = Date.now()
      while now - last >= tickRate
        @emit 'tick'
        last += tickRate
      @emit 'idle'
    , tickRate
    return

  stop: ->
    return unless @timer
    clearInterval @timer
    @timer = null
  
module.exports = Loop

vows = require 'vows'
assert = require 'assert'
Loop = require '../../game/loop'

exports.specs = vows.describe('Loop tests').addBatch

  "starting a loop": 
    topic: ->
      l = new Loop
      l.on 'tick', => @callback(null, l)
      l.start()
      undefined
     
    "should call tick event callback": (err, l) ->
      l.stop()
  
  "with a loop that ticks 50 times per second":
    topic: ->
      l = new Loop
      l.ticksPerSecond = 50
      l
      
    "looping for 50 ticks":
      topic: (l) ->        
        ticks = 0
        start = Date.now()
        l.on 'tick', => 
          ticks++
          return if ticks isnt 50         
          l.stop()
          @callback null, Date.now() - start
        l.start()        
        undefined
        
      "should have spent around 1 second": (err, elapsed) ->        
        assert.isTrue 900 < elapsed < 1100
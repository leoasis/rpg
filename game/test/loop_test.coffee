vows = require 'vows'
assert = require 'assert'
Loop = require '../loop'

exports.specs = vows.describe('Loop tests').addBatch

  "starting a loop": 
    topic: ->
      l = new Loop
      l.on 'tick', @callback
      l.start()
      undefined
     
    "should call tick event callback": ->
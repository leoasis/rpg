vows = require 'vows'
assert = require 'assert'
Loop = require '../../server/loop'

specs = vows.describe 'Loop tests'

specs.addBatch

  'starting a loop': 
    topic: ->
      handler = {}
      handler.tick = => @callback()
      l = new Loop handler
      l.start()
      undefined
     
    'should call tick for handler': ->
    
.export module

vows = require 'vows'
assert = require 'assert'
Loop = require '../../server/loop'

specs = vows.describe 'Loop tests'

specs.addBatch

  'starting a loop': 
    topic: ->
      l = new Loop
      l.on 'tick', @callback
      l.start()
      undefined
     
    'should call tick event callback': ->
    
.export module

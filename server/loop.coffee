class Loop
  constructor: (handler) ->
    @handler = handler
  
  interval: 50
    
  start: ->            
    @timer = setInterval =>
      @handler.tick()
    , interval
    
  stop: ->    
    clearInterval @timer
    @timer = null
  
module.exports = Loop

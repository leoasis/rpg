class Interval
  constructor: (steps) ->
    @steps = steps
    @currStep = -1
    
  start: ->
    @currStep = 0
    
  forward: ->
    if @inProgress() 
      @currStep++
    else if @_nextAction?
      nextAction = @_nextAction
      @_nextAction = null
      nextAction()
      @start()
    
  inProgress: ->
    0 <= @currStep < @steps
    
  next: (nextAction) ->
    if not @inProgress()
      nextAction()
      @start()
    else
      @_nextAction = nextAction
    
module.exports = Interval

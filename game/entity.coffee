{EventEmitter} = require 'events'

class Entity extends EventEmitter  
  constructor: ->
    @components = []    
    
  addComponent: (component) ->
    @components.push component
    component.owner = this
    this[component.name] = component
    
  init: -> @_callComponents 'init'
  update: -> @_callComponents 'update'
  
  destroy: -> 
    @_callComponents 'destroy'
    @emit 'destroyed', this
    
  _callComponents: (method) ->
    component[method]() for component in @components when component[method]?
    
exports.Entity = Entity
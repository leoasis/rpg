{EventEmitter} = require 'events'
components = require './components'
extend = require './extend'

types = {}

exports.loadTypes = (theTypes) ->
  types = theTypes

  
class Entity extends EventEmitter  
  constructor: ->
    @components = []    
    
  addComponent: (component) ->
    @components.push component
    component.owner = this
    this[component.name] = component
    
  init: -> @_callComponents 'init'
  update: -> @_callComponents 'update'

  serialize: ->
    obj = type: @type, id: @id
    for component in @components when component.serialize?
      obj[component.name] = component.serialize()      
    obj
    
  destroy: -> 
    @_callComponents 'destroy'
    @emit 'destroyed', this
    
  _callComponents: (method) ->
    component[method]() for component in @components when component[method]?
  
exports.createFrom = (description) ->
    entity = new Entity
    entity.type = description.type
    for key, value of types[description.type]
      entity.addComponent components.oneOf(key, extend(true, {}, value, description[key])) 
      
    entity.init()
    entity
components = require './components'
extend = require './extend'

types = {}

exports.loadTypes = (theTypes) ->
  types = theTypes

  
class Entity
  constructor: ->
    @components = []
    
  addComponent: (component) ->
    @components.push component
    component.owner = this
    this[component.name] = component
    
  update: ->
    component.update() for component in @components when component.update?
  
exports.createFrom = (description) ->
    entity = new Entity
    entity.type = description.type
    for key, value of types[description.type]
      entity.addComponent components.oneOf(key, extend(true, {}, value, description[key]))       
    entity
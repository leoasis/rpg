componentFactory = require './component_factory'
extend = require './extend'

types = {}
entityType = undefined

exports.for = (type) ->   
  entityType = type  

exports.loadTypes = (theTypes) ->
  types = theTypes

exports.create = (description) ->
  entity = new entityType
  entity.type = description.type
  
  #Add all components defined in archetype, overriding properties if needed
  for key, value of types[description.type]
    entity.addComponent componentFactory.create key, extend(true, {}, value, description[key]) 
    
  #Also add new components defined in the description, that are not defined in the archetype
  for key, value of description when not types[description.type][key]? and typeof value is 'object'    
    entity.addComponent componentFactory.create key, value
    
  entity.init()
  entity
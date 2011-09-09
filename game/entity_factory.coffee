components = require './components'
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
  for key, value of types[description.type]
    entity.addComponent components.oneOf(key, extend(true, {}, value, description[key])) 
    
  entity.init()
  entity
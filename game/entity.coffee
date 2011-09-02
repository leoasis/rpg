components = require './components'
extend = require './extend'

types = {}

exports.loadTypes = (theTypes) ->
  types = theTypes

exports.createFrom = (description) ->
    entity = {} 
    entity.type = description.type
    for key, value of types[description.type]
      entity[key] = components.oneOf key, entity, extend(true, {}, value, description[key])       
    entity
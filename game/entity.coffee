components = require './components'

types = {}

exports.loadTypes = (theTypes) ->
  types = theTypes

exports.createFrom = (description) ->
    entity = {} 
    entity.type = description.type
    for key, value of description when key isnt 'type'
      entity[key] = components.oneOf key, entity, merge(types[key], value) 
    entity

merge = (objA, objB) ->
  if typeof objB is 'object'
    objA or= {}
    for key, value in objB
      objA[key] = merge objA[key], objB[key]
  else
    objB or {}

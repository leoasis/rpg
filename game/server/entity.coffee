components = require './components'

types = []

exports.loadTypes = (theTypes) ->
    for type in theTypes
      types[type] = theTypes[type]
    undefined

exports.createFrom = (description) ->
    entity = {} 
    entity.type = description.type
    for key, value of description when key isnt 'type'
      entity[key] = components.oneOf key, entity, merge(types[key], value) 
    entity

merge = (obj, obj2) ->
  obj
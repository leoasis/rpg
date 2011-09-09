base = require '../entity'

class Entity extends base.Entity

  serialize: ->
    obj = type: @type, id: @id
    for component in @components when component.serialize?
      obj[component.name] = component.serialize()      
    obj
    
exports.Entity = Entity
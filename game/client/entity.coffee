base = require '../entity'
extend = require '../extend'

class Entity extends base.Entity

  update: (data) ->
    for name, value of data
      extend true, this[name], value
    
exports.Entity = Entity
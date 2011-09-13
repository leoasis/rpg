extend = require './extend'

components = {}

exports.register = ->  
  components[arguments[0]] = arguments[1] if arguments.length is 2
  extend components, arguments[0] if arguments.length is 1

exports.create = (name, properties) ->  
  ctor = components[name]
  if ctor?
    component = new ctor
  else  
    component = {}
  component.name = name
  extend component, properties  
events = require 'events'
Interval = require './interval'

class WorldObject extends events.EventEmitter
  constructor: (id) ->
    @id = id
    @_intervals = []

  update: ->    
    interval.forward() for interval in @_intervals
    @emit 'updated'
    
  interval: (name, steps) ->
    interval = new Interval steps
    @_intervals.push interval
    @["#{name}Interval"] = interval
  
module.exports = WorldObject

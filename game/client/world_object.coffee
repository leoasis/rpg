events = require 'events'
class WorldObject extends events.EventEmitter
  update: ->
    @_update()
    @emit 'updated', this
    
  _update: ->
  
module.exports = WorldObject

fs = require 'fs'
express = require('express')

module.exports.start = (app) ->

  app.configure ->
    app.set 'views', __dirname + '/views'
    app.set 'view engine', 'jade'
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router
    app.use express.static __dirname + '/site/public'
    app.use require('browserify')(
      require: __dirname + '/../game/client.coffee'
    )
     
  app.dynamicHelpers
    scripts: -> []
          
  app.configure 'development', ->
    app.use express.errorHandler dumpExceptions: true, showStack: true

  app.configure 'production', ->
    app.use express.errorHandler()

  # Routes
  fs.readdir __dirname + '/routes', (err, list) ->
    return if (err or !list)    
    list.forEach (f) ->
      require('./routes/' + f) app


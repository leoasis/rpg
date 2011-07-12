express = require 'express'

module.exports.start = ->
  app = express.createServer()

  app.configure ->
    app.set 'view options', { layout: false }

  app.get '/', (req, res) ->
    res.render 'index.ejs'

  app.listen 3000


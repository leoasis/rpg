site = require './site/start'
game = require './game/start'

app = site.start()
game.start app

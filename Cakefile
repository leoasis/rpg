{exec} = require 'child_process'
vowsPath = 'node_modules/vows/bin/vows'
coffeePath = 'node_modules/coffee-script/bin/coffee'

run = (command) ->
  exec command, (error, stdout, stderr) ->
    console.log "#{stdout}" if stdout.length > 0
    console.log "#{stderr}" if stderr.length > 0
    console.log "exec error: #{error}" if error?

runTests = (testsPath) ->
  run "#{vowsPath} #{testsPath}/*.coffee --spec"

task 'test:game', 'Runs game tests', ->
  runTests 'test/game'

task 'test', 'Runs all tests', ->
  invoke 'test:game'

task 'run', 'Runs the application', ->
  run "#{coffeePath} app.coffee"
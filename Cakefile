{exec} = require 'child_process'
vowsPath = 'node_modules/vows/bin/vows'

run = (command) ->
  exec command, (error, stdout, stderr) ->
    console.log "#{stdout}" if stdout.length > 0
    console.log "#{stderr}" if stderr.length > 0
    console.log "exec error: #{error}" if (not error?)

task 'test:game.server', 'Runs game server tests', ->
  testsPath = 'game/test/server'
  run "#{vowsPath} #{testsPath}/*.coffee"
    
task 'test', 'Runs all tests', ->
  invoke 'test:game.server'

{exec} = require 'child_process'
vowsPath = 'node_modules/vows/bin/vows'

run = (command) ->
  exec command, (error, stdout, stderr) ->
    console.log "#{stdout}" if stdout.length > 0
    console.log "#{stderr}" if stderr.length > 0
    console.log "exec error: #{error}" if (not error?)

runTests = (testsPath) ->
  run "#{vowsPath} #{testsPath}/*.coffee --spec"

task 'test:game', 'Runs game tests', ->
  runTests 'test/game'

task 'test', 'Runs all tests', (options) ->
  invoke 'test:game'

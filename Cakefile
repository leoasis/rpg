{exec} = require 'child_process'
vowsPath = 'node_modules/vows/bin/vows'

run = (command) ->
  exec command, (error, stdout, stderr) ->
    console.log "#{stdout}" if stdout.length > 0
    console.log "#{stderr}" if stderr.length > 0
    console.log "exec error: #{error}" if (not error?)

task 'test:game.server', 'Runs game server tests', ->
  testsPath = 'game/test/server'
  run "#{vowsPath} #{testsPath}/*.coffee --spec"


task 'run:test', 'Runs all tests', (options) ->
  console.log "#{vowsPath} #{options.arguments[1]} --spec"

option '-f', '--file [PATH]', 'File path'

task 'test', 'Runs all tests', (options) ->  
  if (options.file)
    run "#{vowsPath} #{options.file} --spec"
  else
    invoke 'test:game.server'

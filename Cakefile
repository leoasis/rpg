{spawn, exec} = require 'child_process'
fs = require 'fs'
vowsPath = 'node_modules/vows/bin/vows'
coffeePath = 'node_modules/coffee-script/bin/coffee'

run = (command, options) ->
  console.log "Running: #{command} #{options.join(' ')}"
  child = spawn command, options
  child.stdout.setEncoding 'utf8'
  child.stderr.setEncoding 'utf8'
  child.stdout.on 'data', (data) ->
    console.log data
  child.stderr.on 'data', (data) ->
    console.log data
    
runSync = (command) ->
  exec command, (error, stdout, stderr) ->
    console.log "#{stdout}" if stdout.length > 0
    console.log "#{stderr}" if stderr.length > 0

runTests = (testsPath) ->
  testFiles = ("#{testsPath}/#{file}" for file in fs.readdirSync testsPath)
  run vowsPath, testFiles.concat ["--spec"]

task 'test', 'Runs all tests', ->
  run vowsPath, ["--spec"]

task 'run', 'Runs the application', ->
  run coffeePath, ["app.coffee"]
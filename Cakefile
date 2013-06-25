fs = require 'fs'
child_process = require 'child_process'
_ = require 'underscore'
nap = require('nap')

task 'assets', 'Compile, embed, minify, and gzip asset packages', ->
  console.log "Compiling, packaging, embedding, minifying, & gzipping assets..."
  start = new Date().getTime()
  nap
    mode: 'production'
    assets: require('./config/assets.coffee')
    gzip: true
  nap.package()
  end = new Date().getTime()
  console.log "Finished in #{end - start}ms!"

task 'assets:fast', 'Compile asset packages but dont embed, minify, or gzip anything', ->
  console.log "Compiling & packaging assets..."
  start = new Date().getTime()
  nap
    mode: 'development'
    assets: require('./config/assets.coffee')
    gzip: false
  nap.package()
  end = new Date().getTime()
  console.log "Finished in #{end - start}ms!"

task 'test', 'run Mocha tests', ->
  spawn "mocha test/config -r should --growl -t 10000 -R list", ->
    spawn "mocha test/integration -r should --growl -t 10000 -R list"

spawn = (command, callback = (->)) ->
  args = command.split(" ")
  child = child_process.spawn args[0], _.rest(args),
    customFds: [0, 1, 2]
  child.on 'exit', (code) ->
    if code == 0
      callback()
    else
      process.exit(code)

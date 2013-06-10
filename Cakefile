fs = require 'fs'
child_process = require 'child_process'
_ = require 'underscore'

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

global._ = require 'underscore'
global._.mixin require 'underscore.string'
global.should = require 'should'
process.env.NODE_ENV = 'test'
global.fs = require 'fs'
global._jade = require 'jade'

require "#{process.cwd()}/app.coffee"

process.on 'exit', ->
  try
    app?.close()

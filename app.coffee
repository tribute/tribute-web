global._ = require 'underscore'
global._.mixin require 'underscore.string'

global.app = require('express')()
require './config/env'
require './config/middleware'
require './app/routes'

module.exports = app.listen process.env.PORT, ->
  console.log "Running in #{app.settings.env} on #{process.env.PORT}"

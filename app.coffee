global._ = require 'underscore'
global._.mixin require 'underscore.string'

global.app = require('express')
  expose: require('express-expose')

require './config/env'
require './config/nap'
require './config/middleware'
require './app/server/routes'

app.expose
  apiUrl: app.apiUrl
  rootUrl: app.rootUrl

module.exports = app.listen process.env.PORT, ->
  console.log "Running in #{app.settings.env} on #{process.env.PORT}"

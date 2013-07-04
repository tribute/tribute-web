global._ = require 'underscore'
global._.mixin require 'underscore.string'

global.app = require('express')
  expose: require('express-expose')

require './config/env'
require './config/nap'
require './config/middleware'

if app.settings.env == 'test'
  require './test/api/routes.coffee'

require './app/server/routes'
require './app/server/handlers'

app.expose
  apiUrl: app.apiUrl
  rootUrl: app.rootUrl
  debug: !! process.env.DEBUG

module.exports = app.listen process.env.PORT, ->
  console.log "Running in #{app.settings.env} on #{process.env.PORT}"

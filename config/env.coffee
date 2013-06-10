express = require 'express'

switch app.settings.env

  when 'development'
    app.port = process.env.PORT || 9293
    app.rootUrl = "http://#{process.env.HOST || 'localhost'}:#{app.port}"
    process.env.PORT = app.port
    app.use express.errorHandler dumpExceptions: true, showStack: true

  when 'test'
    app.port = 5000
    app.rootUrl = "http://localhost:#{app.port}"
    process.env.PORT = app.port
    app.use express.errorHandler dumpExceptions: true, showStack: true

  when 'production'
    app.rootUrl = if process.env.HOST then "http://#{process.env.HOST}" else require('./app.coffee').productionUrl
    app.use express.errorHandler()

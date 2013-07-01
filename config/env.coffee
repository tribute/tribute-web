express = require('express')

switch app.settings.env

  when 'development'
    app.port = process.env.PORT || 9293
    app.rootUrl = "http://#{process.env.HOST || 'localhost'}:#{app.port}"
    process.env.PORT = app.port
    app.use express.errorHandler dumpExceptions: true, showStack: true
    app.apiUrl = "http://#{process.env.HOST || 'localhost'}:9292"

  when 'test'
    app.port = 5000
    app.rootUrl = "http://localhost:#{app.port}"
    process.env.PORT = app.port
    app.use express.errorHandler dumpExceptions: true, showStack: true
    app.apiUrl = "#{app.rootUrl}/__api"

  when 'production'
    app.rootUrl = "http://#{process.env.HOST}"
    app.use express.errorHandler()
    app.apiUrl = "http://#{process.env.API_HOST || 'api.we-shall-see.net'}"

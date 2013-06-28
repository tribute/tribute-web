express = require 'express'

app.configure ->
  @set 'views', 'app/client/templates'
  @set 'view engine', 'jade'
  @set 'view options', { pretty: true }
  @use express.methodOverride()
  @use express.cookieParser()
  @use express.cookieSession secret: process.env.SESSION_SECRET || 'secret'
  @use express.bodyParser()
  @use express.static 'public'
  @use @router

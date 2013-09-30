@js =
  vendor: [
    '/vendor/jquery/*.js'
    '/vendor/bootstrap/**/*.js'
    '/vendor/emberjs/handlebars*.js'
    '/vendor/emberjs/ember*.js'
    '/vendor/ember.auth2/*.js'
  ]
  server: [
    '/app/server/**/*.coffee'
  ]
  client: [
    '/app/client/client.coffee'
  ]
  models: [
    '/app/client/models/*.coffee'
  ]
  controllers: [
    '/app/client/controllers/*.coffee'
  ]
  routes: [
    '/app/client/routes/*.coffee'
  ]
  fixtures: [
    '/app/client/fixtures/*.coffee'
  ]

@css =
  all: [
    '/vendor/**/*.css'
  ]

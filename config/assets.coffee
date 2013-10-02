@js =
  vendor: [
    '/vendor/jquery/*.js'
    '/vendor/emberjs/handlebars*.js'
    '/vendor/emberjs/ember*.js'
    '/vendor/ember.auth2/*.js'
    '/vendor/semantic/javascript/semantic.min.js'
  ]
  server: [
    '/app/server/**/*.coffee'
  ]
  client: [
    '/app/client/client.coffee'
  ]
  mixins: [
    '/app/client/mixins/*.coffee'
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
    '/app/client/css/*.css'
    '/vendor/semantic/css/*.css'
  ]

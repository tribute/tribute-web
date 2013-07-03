Tribute.Router = Ember.Router.extend
  location: 'history'

Tribute.Router.map ->
  @resource 'index', path: '/'


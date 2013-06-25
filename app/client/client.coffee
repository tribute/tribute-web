window.App = Ember.Application.create()

window.App.IndexRoute = Ember.Route.extend
  model: ->
    ['red', 'yellow', 'blue']

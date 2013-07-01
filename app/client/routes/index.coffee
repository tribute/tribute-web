App.IndexRoute = Ember.Route.extend
  model: ->
    console.log "Fetching status ..."
    App.Status.find 'system'

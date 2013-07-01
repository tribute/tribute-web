App.IndexRoute = Ember.Route.extend
  model: ->
    Ember.debug "Retrieving status/system from #{App.settings.apiUrl}"
    App.Status.find('system')
    # App.Status.createRecord({ id: 'system', message: 'ok' })

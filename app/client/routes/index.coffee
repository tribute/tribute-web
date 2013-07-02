Tribute.IndexRoute = Ember.Route.extend
  model: ->
    Ember.debug "Retrieving status/system from #{Tribute.settings.apiUrl}"
    Tribute.Status.find('system')

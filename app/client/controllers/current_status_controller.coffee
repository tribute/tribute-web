Tribute.CurrentStatusController = Ember.ObjectController.extend
  init: ->
    Ember.debug "Retrieving status/system from #{Tribute.settings.apiUrl}"
    @set 'model', Tribute.Status.find('system')

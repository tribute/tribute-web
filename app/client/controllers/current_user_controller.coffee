Tribute.CurrentUserController = Em.ObjectController.extend
  init: ->
    Ember.debug "Retrieving current user from #{Tribute.settings.apiUrl}"
    @set 'model', Tribute.User.find('current')

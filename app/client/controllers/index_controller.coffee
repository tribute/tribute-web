Tribute.IndexController = Ember.Controller.extend
  needs: [ 'currentStatus', 'currentUser' ]

  auth: ->
    @authHelper ||= Tribute.Auth.create
      endpoint: Tribute.settings.apiUrl

  signIn: ->
    @auth().signIn()

  signOut: ->
    @auth().signOut()

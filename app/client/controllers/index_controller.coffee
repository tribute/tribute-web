Tribute.IndexController = Ember.Controller.extend
  needs: [ 'currentStatus', 'currentUser' ]

  init: ->
    #@auth().autoSignIn()

  auth: ->
    #@authHelper ||= Tribute.Auth.create
    #  endpoint: Tribute.settings.apiUrl

  signIn: ->
    #@auth().signIn()

  signOut: ->
    #@auth().signOut()

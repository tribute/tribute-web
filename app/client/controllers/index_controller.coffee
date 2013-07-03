Tribute.IndexController = Ember.Controller.extend
  needs: [ 'currentUser', 'currentStatus' ]

  signIn: ->
    @auth = Tribute.Auth.create
      endpoint: Tribute.settings.apiUrl
    @auth.signIn()

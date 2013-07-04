Tribute.IndexController = Ember.Controller.extend
  needs: [ 'currentStatus', 'currentUser' ]

  signIn: ->
    @auth = Tribute.Auth.create
      endpoint: Tribute.settings.apiUrl
    @auth.signIn()

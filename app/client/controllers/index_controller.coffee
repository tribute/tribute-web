Tribute.IndexController = Ember.Controller.extend
  needs: [ 'currentStatus' ]

  signIn: ->
    Tribute.oauth = Ember.OAuth2.create
      providerId: 'tribute'
    Tribute.oauth.authorize()

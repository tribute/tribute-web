window.Tribute = Ember.Application.create
  settings: app

Tribute.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter

DS.RESTAdapter.configure "plurals"
  status: "status"

DS.RESTAdapter.reopen
  url: Tribute.settings.apiUrl

Ember.OAuth2.config =
  tribute:
    clientId: "test"
    authBaseUri: 'http://localhost:9292/oauth2/auth'
    redirectUri: 'http://localhost:9293/callback'
    scope: 'public write'

Ember.OAuth2.reopen
  onSuccess: ->
    console.log "Successful auth."
  onError: ->
    console.log "Failed"

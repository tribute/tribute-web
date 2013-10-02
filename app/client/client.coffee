window.Tribute = Ember.Application.create
  LOG_TRANSITIONS: app.debug
  settings: app

Tribute.RESTAdapter = DS.RESTAdapter.extend
  url: Tribute.settings.apiUrl

  ajax: (url, type, hash) ->
    @updateToken()
    @_super url, type, hash

  updateToken: ->
    # TODO: there's got to be a better way to do this when token is retrieved
    token = Tribute.sessionStorage.getItem('tribute.authToken')
    @headers.Authorization = token if token && @headers.Authorization != token

Tribute.Store = DS.Store.extend
  revision: 13
  adapter: DS.FixtureAdapter


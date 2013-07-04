window.Tribute = Ember.Application.create
  LOG_TRANSITIONS: true
  settings: app

  storage: (->
    storage = null
    try
      storage = window.localStorage || throw('no storage')
    catch err
      storage = Storage.create()

    storage
  )()

  sessionStorage: (->
    storage = null
    try
      # firefox will not throw error on access for sessionStorage var,
      # you need to actually get something from session
      sessionStorage.getItem('invalid')
      storage = sessionStorage
    catch err
      storage = Storage.create()
    storage
  )()

Tribute.RESTAdapter = DS.RESTAdapter.extend
  url: Tribute.settings.apiUrl

  ajax: (url, type, hash) ->
    @updateToken()
    @_super url, type, hash

  updateToken: ->
    # TODO: there's got to be a better way to do this when token is retrieved
    token = Tribute.sessionStorage.getItem('tribute.token')
    @headers.Authorization = token if @headers.Authorization != token

Tribute.RESTAdapter.configure "plurals"
  status: "status"

Tribute.Store = DS.Store.extend
  revision: 12
  adapter: Tribute.RESTAdapter


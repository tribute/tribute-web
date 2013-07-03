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

    Ember.debug "session storage: #{storage}"
    storage
  )()

Tribute.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter

DS.RESTAdapter.configure "plurals"
  status: "status"

DS.RESTAdapter.reopen
  url: Tribute.settings.apiUrl


window.Tribute = Ember.Application.create
  settings: app
  Models: {}

Tribute.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter

DS.RESTAdapter.configure "plurals"
  status: "status"

DS.RESTAdapter.reopen
  url: Tribute.settings.apiUrl


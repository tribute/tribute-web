window.App = Ember.Application.create
  settings: app
  Models: {}

App.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter

DS.RESTAdapter.configure "plurals"
  status: "status"

DS.RESTAdapter.reopen
  url: App.settings.apiUrl


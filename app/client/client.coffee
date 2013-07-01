window.App = Ember.Application.create
  settings: app
  Models: {}

App.Store = DS.Store.extend
  revision: 12

DS.RESTAdapter.configure "plurals"
  status: "status"

console.log "Expecting API server on #{App.settings.apiUrl} ..."

DS.RESTAdapter.reopen
  url: App.settings.apiUrl


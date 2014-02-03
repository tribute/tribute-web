TeamsRoute = Ember.Route.extend
  model: -> 
    @store.find('team')
  renderTemplate: ->
    @render 'teams', into: 'application'

`export default TeamsRoute`

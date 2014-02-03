TeamsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'team', {}
  actions:
    cancel: ->
      @transitionTo 'teams.index'
    save: ->
      route = this
      @controller.saveEdits().then( ->
        route.transitionTo 'teams.index'
      )
    deactivate: ->
      @controller.stopEditing()

`export default TeamsNewRoute`

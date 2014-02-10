TeamsNewRoute = Ember.Route.extend
  beforeModel: ->
    # make sure companies are loaded for new team form
    @controllerFor('companies').set('content', @store.find('company'))
  model: ->
    @store.createRecord 'team', {}
  actions:
    cancel: ->
      @get('currentModel').deleteRecord()
      @transitionTo 'teams.index'
    save: ->
      route = this
      @get('currentModel').save().then( ->
        route.transitionTo 'team.show', route.get('currentModel')
      )

`export default TeamsNewRoute`

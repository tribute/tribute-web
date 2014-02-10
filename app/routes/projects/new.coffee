ProjectsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'project', {}
  actions:
    cancel: ->
      @get('currentModel').deleteRecord()
      @transitionTo('projects.index')
    save: ->
      route = this
      @get('currentModel').save().then( ->
        route.transitionTo 'project.show', route.get('currentModel')
      )

`export default ProjectsNewRoute`

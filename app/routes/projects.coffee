ProjectsRoute = Ember.Route.extend
  model: -> 
    @store.find('project')
  renderTemplate: ->
    @render 'projects', into: 'application'

`export default ProjectsRoute`

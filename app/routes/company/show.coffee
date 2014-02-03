CompanyShowRoute = Ember.Route.extend
  model: ->
    @modelFor 'company'
  hasProjects: ->
    @get('projectusers.length') > 0

`export default CompanyShowRoute`

CompaniesRoute = Ember.Route.extend
  model: -> 
    @store.find 'company'
  renderTemplate: ->
    @render 'companies', into: 'application'

`export default CompaniesRoute`

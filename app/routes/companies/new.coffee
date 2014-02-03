CompaniesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'company', {}
  actions:
    cancel: ->
      @get('currentModel').deleteRecord()
      @transitionTo 'companies.index'
    save: ->
      route = this
      @get('currentModel').save().then( ->
        route.transitionTo 'companies.index'
      )

`export default CompaniesNewRoute`

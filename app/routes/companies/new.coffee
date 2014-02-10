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
        route.transitionTo 'company.show', route.get('currentModel')
      )

`export default CompaniesNewRoute`

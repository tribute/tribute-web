Tribute.Router = Ember.Router.extend
  location: 'history'

Tribute.Router.map ->
  @resource 'index', path: '/'
  @resource 'projects', path: '/projects', () ->
    @route 'new', path: '/new'
    @resource 'project', path: '/:project_id', () ->
      @route 'show', path: '/'
  @resource 'companies', path: '/companies', () ->
    @route 'new', path: '/new'
    @resource 'company', path: '/:company_id', () ->
      @route 'show', path: '/'
  @resource 'teams', path: '/teams', () ->
    @route 'new', path: '/new'
    @resource 'team', path: '/:team_id', () ->
      @route 'show', path: '/'

Tribute.ProjectsRoute = Ember.Route.extend
  model: -> 
    return Tribute.Project.find()
  renderTemplate: ->
    @render 'projects', into: 'application'

Tribute.ProjectShowRoute = Ember.Route.extend
  model: ->
    @modelFor 'project'

Tribute.ProjectsNewRoute = Ember.Route.extend
  model: ->
    transaction = @store.transaction()
    transaction.createRecord Tribute.Project, {}
  events:
    cancel: ->
      @controller.stopEditing()
      @transitionTo 'projects.index'
    save: ->
      route = this
      @controller.saveEdits().then( ->
        route.transitionTo 'projects.index'
      )
    deactivate: ->
      @controller.stopEditing()

Tribute.CompaniesRoute = Ember.Route.extend
  model: -> 
    return Tribute.Company.find()
  renderTemplate: ->
    @render 'companies', into: 'application'

Tribute.CompanyShowRoute = Ember.Route.extend
  model: ->
    @modelFor 'company'

Tribute.CompaniesNewRoute = Ember.Route.extend
  model: ->
    transaction = @store.transaction()
    transaction.createRecord Tribute.Company, {}
  events:
    cancel: ->
      @controller.stopEditing()
      @transitionTo 'companies.index'
    save: ->
      route = this
      @controller.saveEdits().then( ->
        route.transitionTo 'companies.index'
      )
    deactivate: ->
      @controller.stopEditing()

Tribute.TeamsRoute = Ember.Route.extend
  model: -> 
    teams = Tribute.Team.find()
    console.log teams
    return teams
  renderTemplate: ->
    @render 'teams', into: 'application'

Tribute.TeamShowRoute = Ember.Route.extend
  model: ->
    @modelFor 'team'

Tribute.TeamsNewRoute = Ember.Route.extend
  model: ->
    transaction = @store.transaction()
    transaction.createRecord Tribute.Team, {}
  events:
    cancel: ->
      @controller.stopEditing()
      @transitionTo 'teams.index'
    save: ->
      route = this
      @controller.saveEdits().then( ->
        route.transitionTo 'teams.index'
      )
    deactivate: ->
      @controller.stopEditing()

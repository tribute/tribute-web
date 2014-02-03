Router = Ember.Router.extend
  location: 'history'

Router.map ->
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

`export default Router`

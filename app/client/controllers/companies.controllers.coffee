Tribute.CompaniesController = Ember.ArrayController.extend
  sortProperties: ['name']
  sortAscending: true

Tribute.CompaniesNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {})

Tribute.CompanyShowController = Ember.ObjectController.extend
  teamCount: (-> 
    @get('teams.length')
  ).property('content')
  hasTeams: (->
    @get('teamCount') > 0
  ).property('content')
  projectUsersCount: (->
    @get('projectUsers.length')
  ).property('content')
  hasProjects: (->
    @get('projectUsersCount') > 0
  ).property('content')

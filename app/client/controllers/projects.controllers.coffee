Tribute.ProjectsController = Ember.ArrayController.extend
  sortProperties: ['name']
  sortAscending: true

Tribute.ProjectsNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {})

Tribute.ProjectShowController = Ember.ObjectController.extend
  teamCount: (-> 
    @get('projectUsers.length')
  ).property('content')
  hasTeams: (->
    @teamCount > 0
  ).property('content')

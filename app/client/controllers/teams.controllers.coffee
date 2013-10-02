Tribute.TeamsController = Ember.ArrayController.extend
  sortProperties: ['name']
  sortAscending: true

Tribute.TeamsNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {})

Tribute.TeamShowController = Ember.ObjectController.extend
  projectCount: (->
    @get('projectUsers.length')
  ).property('content')
  hasProjects: (->
    @get('projectCount') > 0
  ).property('content')

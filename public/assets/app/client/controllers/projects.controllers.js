(function() {
  Tribute.ProjectsController = Ember.ArrayController.extend({
    sortProperties: ['name'],
    sortAscending: true
  });

  Tribute.ProjectsNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {});

  Tribute.ProjectShowController = Ember.ObjectController.extend({
    teamCount: (function() {
      return this.get('projectUsers.length');
    }).property('content'),
    hasTeams: (function() {
      return this.teamCount > 0;
    }).property('content')
  });

}).call(this);

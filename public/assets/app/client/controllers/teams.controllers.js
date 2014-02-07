(function() {
  Tribute.TeamsController = Ember.ArrayController.extend({
    sortProperties: ['name'],
    sortAscending: true
  });

  Tribute.TeamsNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {});

  Tribute.TeamShowController = Ember.ObjectController.extend({
    projectCount: (function() {
      return this.get('projectUsers.length');
    }).property('content'),
    hasProjects: (function() {
      return this.get('projectCount') > 0;
    }).property('content')
  });

}).call(this);

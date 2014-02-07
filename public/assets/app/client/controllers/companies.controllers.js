(function() {
  Tribute.CompaniesController = Ember.ArrayController.extend({
    sortProperties: ['name'],
    sortAscending: true
  });

  Tribute.CompaniesNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {});

  Tribute.CompanyShowController = Ember.ObjectController.extend({
    teamCount: (function() {
      return this.get('teams.length');
    }).property('content'),
    hasTeams: (function() {
      return this.get('teamCount') > 0;
    }).property('content'),
    projectUsersCount: (function() {
      return this.get('projectUsers.length');
    }).property('content'),
    hasProjects: (function() {
      return this.get('projectUsersCount') > 0;
    }).property('content')
  });

}).call(this);

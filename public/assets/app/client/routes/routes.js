(function() {
  Tribute.Router = Ember.Router.extend({
    location: 'history'
  });

  Tribute.Router.map(function() {
    this.resource('index', {
      path: '/'
    });
    this.resource('projects', {
      path: '/projects'
    }, function() {
      this.route('new', {
        path: '/new'
      });
      return this.resource('project', {
        path: '/:project_id'
      }, function() {
        return this.route('show', {
          path: '/'
        });
      });
    });
    this.resource('companies', {
      path: '/companies'
    }, function() {
      this.route('new', {
        path: '/new'
      });
      return this.resource('company', {
        path: '/:company_id'
      }, function() {
        return this.route('show', {
          path: '/'
        });
      });
    });
    return this.resource('teams', {
      path: '/teams'
    }, function() {
      this.route('new', {
        path: '/new'
      });
      return this.resource('team', {
        path: '/:team_id'
      }, function() {
        return this.route('show', {
          path: '/'
        });
      });
    });
  });

  Tribute.ProjectsRoute = Ember.Route.extend({
    model: function() {
      return Tribute.Project.find();
    },
    renderTemplate: function() {
      return this.render('projects', {
        into: 'application'
      });
    }
  });

  Tribute.ProjectShowRoute = Ember.Route.extend({
    model: function() {
      return this.modelFor('project');
    }
  });

  Tribute.ProjectsNewRoute = Ember.Route.extend({
    model: function() {
      var transaction;
      transaction = this.store.transaction();
      return transaction.createRecord(Tribute.Project, {});
    },
    events: {
      cancel: function() {
        this.controller.stopEditing();
        return this.transitionTo('projects.index');
      },
      save: function() {
        var route;
        route = this;
        return this.controller.saveEdits().then(function() {
          return route.transitionTo('projects.index');
        });
      },
      deactivate: function() {
        return this.controller.stopEditing();
      }
    }
  });

  Tribute.CompaniesRoute = Ember.Route.extend({
    model: function() {
      return Tribute.Company.find();
    },
    renderTemplate: function() {
      return this.render('companies', {
        into: 'application'
      });
    }
  });

  Tribute.CompanyShowRoute = Ember.Route.extend({
    model: function() {
      return this.modelFor('company');
    }
  });

  Tribute.CompaniesNewRoute = Ember.Route.extend({
    model: function() {
      var transaction;
      transaction = this.store.transaction();
      return transaction.createRecord(Tribute.Company, {});
    },
    events: {
      cancel: function() {
        this.controller.stopEditing();
        return this.transitionTo('companies.index');
      },
      save: function() {
        var route;
        route = this;
        return this.controller.saveEdits().then(function() {
          return route.transitionTo('companies.index');
        });
      },
      deactivate: function() {
        return this.controller.stopEditing();
      }
    }
  });

  Tribute.TeamsRoute = Ember.Route.extend({
    model: function() {
      var teams;
      teams = Tribute.Team.find();
      console.log(teams);
      return teams;
    },
    renderTemplate: function() {
      return this.render('teams', {
        into: 'application'
      });
    }
  });

  Tribute.TeamShowRoute = Ember.Route.extend({
    model: function() {
      return this.modelFor('team');
    }
  });

  Tribute.TeamsNewRoute = Ember.Route.extend({
    model: function() {
      var transaction;
      transaction = this.store.transaction();
      return transaction.createRecord(Tribute.Team, {});
    },
    events: {
      cancel: function() {
        this.controller.stopEditing();
        return this.transitionTo('teams.index');
      },
      save: function() {
        var route;
        route = this;
        return this.controller.saveEdits().then(function() {
          return route.transitionTo('teams.index');
        });
      },
      deactivate: function() {
        return this.controller.stopEditing();
      }
    }
  });

}).call(this);

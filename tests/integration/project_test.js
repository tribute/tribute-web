var App;
var td = testdata();

module('Integration - Projects', {
  setup: function(){
    fakehr.start();
    App = startApp();
  },
  teardown: function() {
    fakehr.reset();
    Ember.run(App, 'destroy');
  }
});

test('Projects path shows projects list', function() {
  expect(4);

  visit('/projects').then(function() {
    httpRespond( 'GET', '/api/projects', { projects: [] }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "projects.index", "Switched to projects.index route");
      equal(find("#tribute-projects-header a:contains('Add')").length, 1, 'Link to create new project');
      return click("#tribute-projects-header a:contains('Add')");    
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "projects.new", "Switched to projects.new route");
      equal(find('#tribute-new-project-form').length, 1, "New project form shown"); 
    });
  });
});

test('Project show page shows project details', function() {
  expect(5);

  visit('/projects').then(function() {
    httpRespond( 'GET', '/api/projects', { projects: td.projects, projectusers: td.projectusers, teams: td.teams, companies: td.companies }).then(function() {
      equal(find("#tribute-projects-list a:contains('" + td.project.name + "')").length, 1, "Project name appears in project list");
      return click("#tribute-projects-list a:contains('" + td.project.name + "')");
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "project.show", "Switched to projects.show route");
      equal(find("#tribute-project-name a:contains(" + td.project.name + ")").length, 1, "Project name is shown"); 
      equal(find("#tribute-project-desc p:contains(" + td.project.description + ")").length, 1, "Project description is shown"); 
      equal(find("#tribute-project-users a:first:contains(" + td.team.name + " @ " + td.company.name + ")").length, 1, "Project user is shown"); 
    });
  });

});

test('Projects new form creates project', function() {
  expect(5);

  visit('/projects/new').then(function() {
    httpRespond( 'GET', '/api/projects', { projects: [] }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(find("#tribute-projects-header a:contains('Add')").length, 1, 'Project add link appears');
      equal(currentPath, "projects.new", "Switched to projects.new route");
      equal(find('#tribute-new-project-form').length, 1, "New project form shown"); 
      fillIn("#projectNameInput", td.project.name);
      fillIn("#projectDescriptionInput", td.project.description);
      fillIn("#projectURLInput", td.project.uri);
      return click("#save-button");
    }).then(function() {
      httpRespond( 'POST', '/api/projects', { project: td.project }).then(function() {
        var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
        equal(currentPath, "project.show", "Switched to projects.show route");
        equal(find("#tribute-projects-list a:contains('" + td.project.name + "')").length, 1, "Project name appears in project list");
      });
    });
  });
});


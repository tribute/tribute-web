var App;

var project = { id: 1, name: "RubyOnRails", description: "Ruby MVC Web framework", uri: "http://github.com/rails/rails", "projectusers": ["1"] };
var projectuser = { id: "1", project: "1", team: "1" };
var team = { id: "1", company: "1", name: "Engineering" };
var company = { id: "1", name: "Github", uri: "http://github.com", teams: ["1"] };
var projects = [];
var projectusers = [];
var companies = [];
var teams = [];
projects[0] = project;
projectusers[0] = projectuser;
companies[0] = company;
teams[0] = team;

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
    httpRespond( 'GET', '/api/projects', { projects: projects, projectusers: projectusers, teams: teams, companies: companies }).then(function() {
      equal(find("#tribute-projects-list a:contains('" + project.name + "')").length, 1, "Project name appears in project list");
      return click("#tribute-projects-list a:contains('" + project.name + "')");
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "project.show", "Switched to projects.show route");
      equal(find("#tribute-project-name a:contains(" + project.name + ")").length, 1, "Project name is shown"); 
      equal(find("#tribute-project-desc p:contains(" + project.description + ")").length, 1, "Project description is shown"); 
      equal(find("#tribute-project-users a:first:contains(" + team.name + " @ " + company.name + ")").length, 1, "Project user is shown"); 
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
      fillIn("#projectNameInput", project.name);
      fillIn("#projectDescriptionInput", project.description);
      fillIn("#projectURLInput", project.uri);
      return click("#save-button");
    }).then(function() {
      httpRespond( 'POST', '/api/projects', { project: project }).then(function() {
        var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
        equal(currentPath, "project.show", "Switched to projects.show route");
        equal(find("#tribute-projects-list a:contains('" + project.name + "')").length, 1, "Project name appears in project list");
      });
    });
  });
});


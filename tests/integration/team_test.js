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

module('Integration - Teams', {
  setup: function(){
    fakehr.start();
    App = startApp();
  },
  teardown: function() {
    fakehr.reset();
    Ember.run(App, 'destroy');
  }
});

test('Teams path shows teams list', function() {
  expect(4);

  visit('/teams').then(function() {
    httpRespond( 'GET', '/api/teams', { teams: [] }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "teams.index", "Switched to teams.index route");
      equal(find("#tribute-teams-header a:contains('Add')").length, 1, 'Link to create new team');
      return click("#tribute-teams-header a:contains('Add')");    
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "teams.new", "Switched to teams.new route");
      equal(find('#tribute-new-team-form').length, 1, "New team form shown"); 
    });
  });
});

test('Team show page shows team details', function() {
  expect(3);

  visit('/teams').then(function() {
    var fullTeamName = team.name + " @ " + company.name;
    httpRespond( 'GET', '/api/teams', { teams: teams, projects: projects, projectusers: projectusers, companies: companies }).then(function() {
      equal(find("#tribute-teams-list a:contains('" + fullTeamName + "')").length, 1, "team name appears in teams list");
      return click("#tribute-teams-list a:contains('" + fullTeamName + "')");
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "team.show", "Switched to team.show route");
      equal(find("#tribute-team-name:contains('" + fullTeamName + "')").length, 1, "Team name is shown"); 
      //equal(find(".project a:contains('" + project.name + "')").length, 1, "Project is shown"); 
    });
  });

});

test('Team new form creates team', function() {
  expect(5);

  visit('/teams/new').then(function() {
    httpRespond( 'GET', '/api/teams', { teams: [], projects: projects, projectusers: projectusers, companies: companies }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(find("#tribute-teams-header a:contains('Add')").length, 1, 'Team add link appears');
      equal(currentPath, "teams.new", "Switched to teams.new route");
      equal(find('#tribute-new-team-form').length, 1, "New team form shown"); 
      fillIn("#teamNameInput", team.name);
      fillIn("#teamDescriptionInput", team.description);
      return click("#save-button");
    }).then(function() {
      httpRespond( 'POST', '/api/teams', { team: team }).then(function() {
        var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
        var fullTeamName = team.name + " @ " + company.name;
        equal(currentPath, "team.show", "Switched to team.show route");
        equal(find("#tribute-teams-list a:contains('" + fullTeamName + "')").length, 1, "Team name appears in teams list");
      });
    });
  });
});

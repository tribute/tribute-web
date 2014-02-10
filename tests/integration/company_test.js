var App;

var project = { id: 1, name: "RubyOnRails", description: "Ruby MVC Web framework", uri: "http://github.com/rails/rails", "projectusers": ["1"] };
var projectuser = { id: "1", project: "1", team: "1" };
var team = { id: "1", company: "1", name: "Engineering", projectusers: ["1"] };
var company = { id: "1", name: "Github", uri: "http://github.com", teams: ["1"] };
var projects = [];
var projectusers = [];
var companies = [];
var teams = [];
projects[0] = project;
projectusers[0] = projectuser;
companies[0] = company;
teams[0] = team;

module('Integration - Companies', {
  setup: function(){
    fakehr.start();
    App = startApp();
  },
  teardown: function() {
    fakehr.reset();
    Ember.run(App, 'destroy');
  }
});

test('Companies path shows companies list', function() {
  expect(4);

  visit('/companies').then(function() {
    httpRespond( 'GET', '/api/companies', { companies: [] }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "companies.index", "Switched to companies.index route");
      equal(find("#tribute-companies-header a:contains('Add')").length, 1, 'Link to create new company');
      return click("#tribute-companies-header a:contains('Add')");    
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(currentPath, "companies.new", "Switched to companies.new route");
      equal(find('#tribute-new-company-form').length, 1, "New company form shown"); 
    });
  });
});

test('company show page shows company details', function() {
  expect(5);

  visit('/companies').then(function() {
    httpRespond( 'GET', '/api/companies', { companies: companies, projects: projects, projectusers: projectusers, teams: teams }).then(function() {
      equal(find("#tribute-companies-list a:contains('" + company.name + "')").length, 1, "Company name appears in companies list");
      return click("#tribute-companies-list a:contains('" + company.name + "')");
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      var projectLabel = team.name + ' Team: ' + project.name;
      equal(currentPath, "company.show", "Switched to company.show route");
      equal(find("#tribute-company-name a:contains('" + company.name + "')").length, 1, "Company name is shown"); 
      equal(find("#tribute-company-teams p:contains('" + team.name + "')").length, 1, "Company teams are shown"); 
      equal(find("#tribute-company-projects p:contains('" + projectLabel + "')").length, 1, "Company projects are shown"); 
    });
  });

});

test('companies new form creates company', function() {
  expect(5);

  visit('/companies/new').then(function() {
    httpRespond( 'GET', '/api/companies', { companys: [] }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      equal(find("#tribute-companies-header a:contains('Add')").length, 1, 'company add link appears');
      equal(currentPath, "companies.new", "Switched to companies.new route");
      equal(find('#tribute-new-company-form').length, 1, "New company form shown"); 
      fillIn("#companyNameInput", company.name);
      fillIn("#companyDescriptionInput", company.description);
      fillIn("#companyURLInput", company.uri);
      return click("#save-button");
    }).then(function() {
      httpRespond( 'POST', '/api/companies', { company: company }).then(function() {
        var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
        equal(currentPath, "company.show", "Switched to company.show route");
        equal(find("#tribute-companies-list a:contains('" + company.name + "')").length, 1, "Company name appears in companies list");
      });
    });
  });
});


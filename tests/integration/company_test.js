var App;
var td = testdata();

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
    httpRespond( 'GET', '/api/companies', { companies: td.companies, projects: td.projects, projectusers: td.projectusers, teams: td.teams }).then(function() {
      equal(find("#tribute-companies-list a:contains('" + td.company.name + "')").length, 1, "Company name appears in companies list");
      return click("#tribute-companies-list a:contains('" + td.company.name + "')");
    }).then(function() {
      var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
      var projectLabel = td.team.name + ' Team: ' + td.project.name;
      equal(currentPath, "company.show", "Switched to company.show route");
      equal(find("#tribute-company-name a:contains('" + td.company.name + "')").length, 1, "Company name is shown"); 
      equal(find("#tribute-company-teams p:contains('" + td.team.name + "')").length, 1, "Company teams are shown"); 
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
      fillIn("#companyNameInput", td.company.name);
      fillIn("#companyDescriptionInput", td.company.description);
      fillIn("#companyURLInput", td.company.uri);
      return click("#save-button");
    }).then(function() {
      httpRespond( 'POST', '/api/companies', { company: td.company }).then(function() {
        var currentPath = App.__container__.lookup('controller:application').get('currentRouteName');
        equal(currentPath, "company.show", "Switched to company.show route");
        equal(find("#tribute-companies-list a:contains('" + td.company.name + "')").length, 1, "Company name appears in companies list");
      });
    });
  });
});


var App;

module('Integration - Main Page', {
  setup: function(){
    fakehr.start();
    App = startApp();
  },
  teardown: function() {
    fakehr.reset();
    Ember.run(App, 'destroy');
  }
});

test('Tribute index route shows header', function(){
  expect(2);

  visit('/').then(function(){
    var header = find('div#tribute-header');
    equal(header.length, 1);
    ok(exists("div.title:contains('Tribute')"));
  });
});

test('Tribute index route shows link to projects, companies and teams', function(){
  expect(3);

  visit('/').then(function(){
    equal(find("div#tribute-header div.link a:first").text(), 'Projects', 'Project link displayed');
    equal(find("div#tribute-header div.link a:last").text(), 'Teams', 'Teams link displayed');
    equal(find("div#tribute-header div.link a:eq(1)").text(), 'Companies', 'Companies link displayed');
  });
});

test('Links to projects index page', function(){
  expect(1);

  visit('/').then(function(){
    return click("div#tribute-header div.link a:first");
  }).then(function() {
    httpRespond( 'GET', '/api/projects', { projects: [] }).then(function() {
      equal(find('#tribute-projects-list').length, 1, 'Projects are listed');
    });
  });
});

test('Links to companies index page', function(){
  expect(1);

  visit('/').then(function(){
    return click("div#tribute-header div.link a:eq(1)");
  }).then(function() {
    httpRespond( 'GET', '/api/companies', { companies: [] }).then(function() {
      equal(find('#tribute-companies-list').length, 1, 'Companies are listed');
    });
  });
});

test('Links to teams index page', function(){
  expect(1);

  visit('/').then(function(){
    return click("div#tribute-header div.link a:eq(2)");
  }).then(function() {
    httpRespond( 'GET', '/api/teams', { teams: [] }).then(function() {
      equal(find('#tribute-teams-list').length, 1, 'Teams are listed');
    });
  });
});

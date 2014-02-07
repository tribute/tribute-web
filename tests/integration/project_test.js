var App;

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

test('Projects path shows projects list', function(){
  expect(1);


  visit('/projects').then(function() {
    httpRespond( 'GET', '/api/projects', { projects: [] }).then(function() {
    //equal(App.__container__.lookup('controller:application').get('currentRouteName'), "projects.index", "Project list appears");
    //equal(controllerFor('application').currentPath, "newroute", "Successfully change route...");
      equal(find('h3.header').length, 1, 'Link to create new project');
    });
  });
});

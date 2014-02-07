var App;

module('Integration - Index', {
  setup: function(){
    App = startApp();
  },
  teardown: function() {
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

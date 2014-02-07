import Application from 'appkit/app';

function lookupHelpers(attrs) {
  var App = Application;
  var router = App.container.lookup('router:main').router;

  Ember.Test.registerHelper('path', function() {
    return App.__container__.lookup('controller:application').get('currentRouteName');
  });

}

export default lookupHelpers;

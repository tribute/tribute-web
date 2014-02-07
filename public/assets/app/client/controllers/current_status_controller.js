(function() {
  Tribute.CurrentStatusController = Ember.ObjectController.extend({
    init: function() {
      Ember.debug("Retrieving status/system from " + Tribute.settings.apiUrl);
      return this.set('model', Tribute.Status.find('system'));
    }
  });

}).call(this);

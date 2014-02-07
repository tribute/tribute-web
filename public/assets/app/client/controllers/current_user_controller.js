(function() {
  Tribute.CurrentUserController = Em.ObjectController.extend({
    init: function() {
      return Ember.debug("Retrieving current user from " + Tribute.settings.apiUrl);
    }
  });

}).call(this);

(function() {
  window.Tribute = Ember.Application.create({
    LOG_TRANSITIONS: app.debug,
    settings: app
  });

  Tribute.RESTAdapter = DS.RESTAdapter.extend({
    url: Tribute.settings.apiUrl,
    ajax: function(url, type, hash) {
      this.updateToken();
      return this._super(url, type, hash);
    },
    updateToken: function() {
      var token;
      token = Tribute.sessionStorage.getItem('tribute.authToken');
      if (token && this.headers.Authorization !== token) {
        return this.headers.Authorization = token;
      }
    }
  });

  Tribute.Store = DS.Store.extend({
    revision: 13,
    adapter: DS.FixtureAdapter
  });

}).call(this);

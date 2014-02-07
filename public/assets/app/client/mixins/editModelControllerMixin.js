(function() {
  Tribute.EditModelControllerMixin = Ember.Mixin.create({
    saveEdits: function() {
      var controller, record;
      controller = this;
      record = this.get("content");
      return new Em.RSVP.Promise(function(resolve, reject) {
        var errorHandler, method;
        if (!record.get("isValid") || record.get("isError")) {
          this.resetRecordState();
        }
        if (!record.get("isDirty")) {
          resolve(record);
          return;
        }
        method = (record.get("isNew") === true ? "didCreate" : "didUpdate");
        record.one(method, controller, function() {
          if (method === "didUpdate") {
            return resolve(record);
          } else {
            return record.addObserver("id", this, resolve);
          }
        });
        errorHandler = function() {
          var type;
          type = (this.get("content.isError") ? "error" : "problem");
          return reject(record);
        };
        record.one("becameInvalid", controller, errorHandler);
        record.one("becameError", controller, errorHandler);
        return record.get("transaction").commit();
      });
    },
    deleteRecord: function() {
      var controller, record;
      controller = this;
      record = this.get("content");
      return new Em.RSVP.Promise(function(resolve, reject) {
        record.one("didDelete", controller, function() {
          return resolve();
        });
        record.one("didError", controller, function() {
          return reject(record);
        });
        record.deleteRecord();
        return controller.get("content.transaction").commit();
      });
    },
    stopEditing: function(callback) {
      var controller;
      controller = this;
      return new Em.RSVP.Promise(function(resolve, reject) {
        var content;
        content = controller.get("content");
        if (!content.get("isValid")) {
          content.send("becameValid");
        }
        controller.get("content.transaction").rollback();
        if (content.get("isNew")) {
          content.deleteRecord();
        }
        return resolve();
      });
    },
    resetRecordState: function() {
      var record, state;
      record = this.get("content");
      state = (record.get("id") ? "loaded.updated.uncommitted" : "loaded.created.uncommited");
      return record.get("stateManager").transitionTo(state);
    }
  });

}).call(this);

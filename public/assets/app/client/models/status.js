(function() {
  Tribute.Status = DS.Model.extend({
    primaryKey: 'id',
    message: DS.attr('string')
  });

}).call(this);

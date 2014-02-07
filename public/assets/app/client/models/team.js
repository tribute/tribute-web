(function() {
  Tribute.Team = DS.Model.extend({
    name: DS.attr('string'),
    description: DS.attr('string'),
    company: DS.belongsTo('Tribute.Company'),
    projectUsers: DS.hasMany('Tribute.ProjectUser')
  });

}).call(this);

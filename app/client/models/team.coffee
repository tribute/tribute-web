Tribute.Team = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  company: DS.belongsTo('Tribute.Company')
  projects: DS.hasMany('Tribute.Project')

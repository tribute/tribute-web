Tribute.Company = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  uri: DS.attr('string')
  teams: DS.hasMany('Tribute.Team')
  projectUsers: DS.hasMany('Tribute.ProjectUser')

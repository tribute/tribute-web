Tribute.Project = DS.Model.extend
  uri: DS.attr('string')
  name: DS.attr('string')
  description: DS.attr('string')
  count: DS.attr('number')
  teams: DS.hasMany('Tribute.Team')

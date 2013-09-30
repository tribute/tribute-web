Tribute.Company = DS.Model.extend
  name: DS.attr('string')
  teams: DS.hasMany('Tribute.Team')

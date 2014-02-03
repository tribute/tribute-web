`import team from 'appkit/models/team'`

Company = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  uri: DS.attr('string')
  teams: DS.hasMany('team')

`export default Company`

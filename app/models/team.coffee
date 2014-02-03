`import company from 'appkit/models/company'`
`import projectuser from 'appkit/models/projectuser'`

Team = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  company: DS.belongsTo('company')
  projectusers: DS.hasMany('projectuser')

`export default Team`

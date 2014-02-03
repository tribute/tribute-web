`import projectuser from 'appkit/models/projectuser'`

Project = DS.Model.extend
  uri: DS.attr('string')
  name: DS.attr('string')
  description: DS.attr('string')
  count: DS.attr('number')
  projectusers: DS.hasMany('projectuser')

`export default Project`

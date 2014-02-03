`import team from 'appkit/models/team'`
`import company from 'appkit/models/company'`
`import project from 'appkit/models/project'`

Projectuser = DS.Model.extend
  project: DS.belongsTo('project')
  team: DS.belongsTo('team')

`export default Projectuser`

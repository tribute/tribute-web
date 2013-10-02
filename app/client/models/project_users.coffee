Tribute.ProjectUser = DS.Model.extend
  project: DS.belongsTo('Tribute.Project')
  company: DS.belongsTo('Tribute.Company')
  team: DS.belongsTo('Tribute.Team')

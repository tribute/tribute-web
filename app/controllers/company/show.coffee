CompanyShowController = Ember.ObjectController.extend
  teamCount: (-> 
    @get('teams.length')
  ).property('content')
  hasTeams: (->
    @get('teamCount') > 0
  ).property('content')
  projectusersCount: (->
    @get('projectusers.length')
  ).property('content')
  hasProjects: (->
    @get('projectusersCount') > 0
  ).property('content')

`export default CompanyShowController`

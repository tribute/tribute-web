ProjectShowController = Ember.ObjectController.extend
  teamCount: (-> 
    @get('projectusers.length') || 0
  ).property('content')
  hasTeams: (->
    @teamCount > 0
  ).property('content')

`export default ProjectShowController`

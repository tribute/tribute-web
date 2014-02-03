TeamShowController = Ember.ObjectController.extend
  projectCount: (->
    @get('projectusers.length')
  ).property('content')
  hasProjects: (->
    @get('projectCount') > 0
  ).property('content')


`export default TeamShowController`

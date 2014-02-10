TeamsNewController = Ember.ObjectController.extend
  needs: ['companies']
  companies: Ember.computed.alias('controllers.companies.arrangedContent')

`export default TeamsNewController`

Tribute.ProjectsController = Ember.ArrayController.extend({
  sortProperties: ['name']
  sortAscending: true
})

Tribute.ProjectsNewController = Ember.ObjectController.extend(Tribute.EditModelControllerMixin, {})

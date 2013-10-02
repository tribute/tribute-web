# Mixin to generalize model create/edit functionality
# for use in controllers. 
# from https://gist.github.com/aboma/6023481
Tribute.EditModelControllerMixin = Ember.Mixin.create(

  # works for both save and edit by inspecting record states
  # commit record if it has changed; returns promise of 
  # record create or update
  saveEdits: ->
    controller = this
    record = @get("content")
    new Em.RSVP.Promise((resolve, reject) ->

      # reset transaction if user wants to resubmit record
      # that is invalid or in error state
      @resetRecordState()  if not record.get("isValid") or record.get("isError")
      unless record.get("isDirty")
        resolve record
        return
      method = (if record.get("isNew") is true then "didCreate" else "didUpdate")

      # callback will show record once the id is available
      record.one method, controller, ->
        if method is "didUpdate"

          # resolve promise
          resolve record
        else

          # observe for when id is created since we may need this
          # for transition
          record.addObserver "id", this, resolve

      errorHandler = ->
        type = (if @get("content.isError") then "error" else "problem")

        # reject promise
        reject record


      # callback for invalid or conflict response from server
      record.one "becameInvalid", controller, errorHandler
      record.one "becameError", controller, errorHandler

      # trigger save
      record.get("transaction").commit()
    )


  # returns promise to delete resource
  deleteRecord: ->
    controller = this
    record = @get("content")
    new Em.RSVP.Promise((resolve, reject) ->
      record.one "didDelete", controller, ->
        resolve()

      record.one "didError", controller, ->
        reject record

      record.deleteRecord()
      controller.get("content.transaction").commit()
    )

  stopEditing: (callback) ->
    controller = this
    new Em.RSVP.Promise((resolve, reject) ->
      content = controller.get("content")
      content.send "becameValid"  unless content.get("isValid")
      controller.get("content.transaction").rollback()
      content.deleteRecord()  if content.get("isNew")
      resolve()
    )


  # enable transaction to be submitted again
  resetRecordState: ->
    record = @get("content")
    state = (if record.get("id") then "loaded.updated.uncommitted" else "loaded.created.uncommited")
    record.get("stateManager").transitionTo state
)

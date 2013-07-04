Tribute.Auth = Ember.Object.extend
  state:        "signed-out"
  receivingEnd: "#{location.protocol}//#{location.host}"

  init: ->
    window.addEventListener('message', (e) => @receiveMessage(e))

  signOut: ->
    Ember.debug "Signing out ..."
    Tribute.storage.removeItem('tribute.authToken')
    Tribute.sessionStorage.clear()
    @set('state', 'signed-out')
    if user = Tribute.__container__.lookup('controller:currentUser').get('content')
      if user.get('stateManager.currentPath') == 'rootState.loaded.updated.uncommitted'
        user.send('rollback')
      user.unloadRecord()
    Tribute.__container__.lookup('controller:currentUser').set('content', null)

  signIn: ->
    Ember.debug "Signing in ..."
    @set('state', 'signing-in')
    url = "#{@endpoint}/auth/github/post_message?redirect_uri=#{@receivingEnd}"
    $('<iframe id="auth-frame" />').hide().appendTo('body').attr('src', url)

  signedIn: ->
    @get('state') == 'signed-in'

  receiveMessage: (event) ->
    if event.data == 'redirect'
      window.location = "#{@endpoint}/auth/github/handshake?redirect_uri=#{location}"
    else if event.data.userId? && event.data.authToken?
      Ember.debug "Signed in #{event.data.userId} with #{event.data.authToken}."
      @setSignInData
        authToken: event.data.authToken
        userId: event.data.userId
      @set('state', 'signed-in')

  setSignInData: (data) ->
    Tribute.sessionStorage.setItem('tribute.authToken', data.authToken)
    Tribute.storage.setItem('tribute.authToken', data.authToken)
    Tribute.__container__.lookup('controller:currentUser').set('model', Tribute.User.find(data.userId))

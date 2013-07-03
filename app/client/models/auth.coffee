Tribute.Auth = Ember.Object.extend
  state:        "signed-out"
  receivingEnd: "#{location.protocol}//#{location.host}"

  init: ->
    window.addEventListener('message', (e) => @receiveMessage(e))

  signOut: ->
    Tribute.storage.removeItem('tribute.user')
    Tribute.storage.removeItem('tribute.token')
    Tribute.sessionStorage.clear()
    @set('state', 'signed-out')
    @set('user', undefined)
    if user = Tribute.__container__.lookup('controller:currentUser').get('content')
      if user.get('stateManager.currentPath') == 'rootState.loaded.updated.uncommitted'
        user.send('rollback')
      user.unloadRecord()
    Tribute.__container__.lookup('controller:currentUser').set('content', null)
    if router = Tribute.__container__.lookup('router:main')
      router.send('afterSignOut')

  signIn: (data) ->
    if data
      @autoSignIn(data)
    else
      @set('state', 'signing-in')
      url = "#{@endpoint}/auth/github/frame?redirect_uri=#{@receivingEnd}"
      $('<iframe id="auth-frame" />').hide().appendTo('body').attr('src', url)

  autoSignIn: (data) ->
    data ||= @userDataFrom(Tribute.sessionStorage) || @userDataFrom(Tribute.storage)
    @setData(data) if data

  userDataFrom: (storage) ->
    userJSON = storage.getItem('tribute.user')
    user  = JSON.parse userJSON if userJSON?
    user  = user.user if user?.user
    token = storage.getItem('tribute.token')
    if user && token && @validateUser(user)
      { user: user, token: token }
    else
      # console.log('dropping user, no token') if token?
      storage.removeItem('tribute.user')
      storage.removeItem('tribute.token')
      null

  validateUser: (user) ->
    @validateHas('id', user) && @validateHas('login', user) && @validateHas('token', user) && @validateHas('correct_scopes', user) && user.correct_scopes

  validateHas: (field, user) ->
    if user[field]
      true
    else
      # console.log("discarding user data, lacks #{field}")
      false

  setData: (data) ->
    @storeData(data, Tribute.sessionStorage)
    @storeData(data, Tribute.storage) unless @userDataFrom(Tribute.storage)
    user = @loadUser(data.user)
    # TODO: we should not use __container__ directly, how to do it better?
    #        A good answer seems to do auth in context of controller.
    Tribute.__container__.lookup('controller:currentUser').set('content', user)

    @set('state', 'signed-in')
    
    # Tribute.trigger('user:signed_in', data.user)
    # if router = Tribute.__container__.lookup('router:main')
    #   path = @readAfterSignInPath()
    #   Ember.run.next =>
    #     try
    #       router.send('afterSignIn', path)
    #     catch e
    #       throw e unless e =~ /There are no active handlers/
    #     @refreshUserData(data.user)

  # refreshUserData: (user) ->
  #   Tribute.ajax.get "/users/#{user.id}", (data) =>
  #     Tribute.store.loadIncomplete(Tribute.User, data.user)
  #     # if user is still signed in, update saved data
  #     if @signedIn()
  #       data.user.token = user.token
  #       @storeData(data, Tribute.sessionStorage)
  #       @storeData(data, Tribute.storage)

  signedIn: ->
    @get('state') == 'signed-in'

  storeData: (data, storage) ->
    storage.setItem('tribute.token', data.token) if data.token
    storage.setItem('tribute.user', JSON.stringify(data.user))

  loadUser: (user) ->
    Tribute.User.find(user.id)

  storeAfterSignInPath: (path) ->
    Tribute.sessionStorage.setItem('tribute.after_signin_path', path)

  readAfterSignInPath: ->
    path = Tribute.sessionStorage.getItem('tribute.after_signin_path')
    Tribute.sessionStorage.removeItem('tribute.after_signin_path')
    path

  receiveMessage: (event) ->
    Ember.debug "receiveMessage"
    console.log event.data
    if event.origin == @expectedOrigin()
      if event.data == 'redirect'
        window.location = "#{@endpoint}/auth/github?redirect_uri=#{location}"
      else if event.data.user?
        event.data.user.token = event.data.tribute_token if event.data.tribute_token
        @setData(event.data)

  expectedOrigin: ->
    if @endpoint[0] == '/' then @receivingEnd else @endpoint

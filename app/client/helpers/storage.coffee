Tribute.storage = (->
  storage = null
  try
    storage = window.localStorage || throw('no storage')
  catch err
    storage = Storage.create()

  storage
)()

Tribute.sessionStorage = (->
  storage = null
  try
    # firefox will not throw error on access for sessionStorage var,
    # you need to actually get something from session
    sessionStorage.getItem('invalid')
    storage = sessionStorage
  catch err
    storage = Storage.create()
  storage
)()

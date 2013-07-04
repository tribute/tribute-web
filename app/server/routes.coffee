app.post '/', (req, res) ->
  regex = /[^a-z0-9=\-_]/gi
  authToken = req.body.authToken.replace(regex, '')
  userId = req.body.userId.replace(regex, '')
  res.render 'post_auth.jade', { authToken: authToken, userId: userId }

app.get '*', (req, res) ->
  res.render 'index.jade'


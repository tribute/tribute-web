app.get '/__api/status/system', (req, res) ->
  res.send { status: { id: 'system', message: 'ok' } }

app.get '/__api/users/:id', (req, res) ->
  res.send { user: { id: req.params.id, provider: "github", uid: "github-#{req.params.id}" }}

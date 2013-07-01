app.get '/__api/status/system', (req, res) ->
  res.send { status: { id: 'system', message: 'ok' } }

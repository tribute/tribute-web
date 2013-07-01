express = require('express')

module.exports = api = express()

api.get '/status/system', (req, res) ->
  console.log "RETURNING"
  res.send { status: { id: 'system', message: 'ok' } }

return if api.settings.env == 'test'
api.listen 5001, ->
  console.log "Test server listening on 5001 ..."

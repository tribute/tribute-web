express = require('express')

module.exports = api = express()

# ## CORS middleware
# 
# see: http://stackoverflow.com/questions/7067966/how-to-allow-cors-in-express-nodejs
allowCrossDomain = (req, res, next) ->
  res.header "Access-Control-Allow-Origin", "*"
  res.header "Access-Control-Allow-Methods", "GET,PUT,POST,DELETE"
  res.header "Access-Control-Allow-Headers", "Content-Type, Authorization"
  
  # intercept OPTIONS method
  if "OPTIONS" is req.method
    res.send 200
  else
    next()
api.use allowCrossDomain

api.get '/status/system', (req, res) ->
  console.log "RETURNING"
  res.send { status: { id: 'system', message: 'ok' } }

return if api.settings.env == 'test'
api.listen 5001, ->
  console.log "Test server listening on 5001 ..."

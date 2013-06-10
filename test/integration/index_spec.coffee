require "#{process.cwd()}/test/helpers/integration.coffee"

request = require 'request'

describe 'index.jade', ->
  
  it 'renders page', (done) ->
    request {
      url: "http://localhost:5000/"
    }, (err, res, body) ->
      body.should.include '<h1>Tribute</h1>'
      done()
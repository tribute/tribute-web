require "#{process.cwd()}/app.coffee"

request = require 'request'

describe 'server', ->

  it 'renders index template', (done) ->
    request.get app.rootUrl, (err, res, body) ->
      res.statusCode.should.equal 200
      res.body.should.include "<h1>Welcome to Tribute!</h1>"
      done()

  it 'renders auth post script', (done) ->
    request.post app.rootUrl, { form: { authToken: "token", userId: 42 }}, (err, res, body) ->
      res.statusCode.should.equal 200
      res.body.should.include "localStorage.setItem('tribute.authToken', 'token');"
      res.body.should.include "localStorage.setItem('tribute.userId', '42');"
      done()

  it 'sanitizes token and user id', (done) ->
    request.post app.rootUrl, { form: { authToken: "<script>", userId: "41_42-43=!44$:%_45\n" }}, (err, res, body) ->
      res.statusCode.should.equal 200
      res.body.should.include "localStorage.setItem('tribute.authToken', 'script');"
      res.body.should.include "localStorage.setItem('tribute.userId', '41_42-43=44_45');"
      done()

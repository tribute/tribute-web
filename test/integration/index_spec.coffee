require "#{process.cwd()}/test/helpers/integration.coffee"

request = require 'request'

describe 'index.jade', ->

  it 'renders page', (done) ->
    @browser.window.$('body h1').text().should.equal('Welcome to Tribute!')
    @browser.window.$('body').text().should.include('Current API status is ok')
    done()

  it 'displays signed in user', (done) ->
    @browser.window.Tribute.__container__.lookup('controller:index').auth()
    @browser._windowInScope = @browser.window # HACK, see https://github.com/assaf/zombie/issues/547
    @browser.window.postMessage({ authToken: 'valid token', userId: '42' }, @browser.window.location.toString())
    @browser.wait =>
      @browser.window.$('body').text().should.include 'Current user is github-42'
      done()


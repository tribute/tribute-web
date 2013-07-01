require "#{process.cwd()}/test/helpers/integration.coffee"

request = require 'request'

describe 'index.jade', ->

  it 'renders page', (done) ->
    @browser.window.$('body h1').text().should.equal('Welcome to Tribute!')
    @browser.window.$('body').text().should.include('Current status is ok')
    done()

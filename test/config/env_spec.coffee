require "#{process.cwd()}/app.coffee"

describe 'config production', ->

  before ->
    delete require.cache[require.resolve("#{process.cwd()}/config/env.coffee")]
    app.settings.env = 'development'
    require "#{process.cwd()}/config/env.coffee"

  it 'sets port', ->
    process.env.PORT.should.equal "9293"

  it 'sets apiUrl', ->
    app.apiUrl.should.equal "http://localhost:9292"

describe 'config development', ->

  before ->
    delete require.cache[require.resolve("#{process.cwd()}/config/env.coffee")]
    app.settings.env = 'development'
    require "#{process.cwd()}/config/env.coffee"

  it "sets the root url to localhost:9293", ->
    app.rootUrl.should.equal 'http://localhost:9293'

  it "sets the port", ->
    process.env.PORT.should.equal '9293'

  it 'sets apiUrl', ->
    app.apiUrl.should.equal "http://localhost:9292"

describe 'config test', ->

  before ->
    delete require.cache[require.resolve("#{process.cwd()}/config/env.coffee")]
    app.settings.env = 'test'
    require "#{process.cwd()}/config/env.coffee"

  it "sets the root url to localhost:5000", ->
    app.rootUrl.should.equal 'http://localhost:5000'

  it "changes the port", ->
    process.env.PORT.should.equal '5000'

describe 'config production', ->

  before ->
    delete require.cache[require.resolve("#{process.cwd()}/config/env.coffee")]
    app.settings.env = 'production'
    require "#{process.cwd()}/config/env.coffee"

  it 'sets apiUrl', ->
    app.apiUrl.should.equal "http://api.we-shall-see.net"

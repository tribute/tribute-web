require "./common.coffee"
browser = require 'zombie'
exec = require('child_process').exec

# Sets up a zombie browser configured to test our app on :5000. Some
# convenience functions are also attached to the browser instance.
#
# @param {Function} callback Calls back with (browser) a zombie browser instance
@setupBrowser = (callback) ->
  options =
    debug: process.env.DEBUG is 'true'
    userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.36 " +
               "(KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36"
  browser.visit "http://localhost:5000/", options, (err, browser) ->
    browser.wait ->
      callback browser

beforeEach? (done) ->
  module.exports.setupBrowser (@browser) =>
    done()

afterEach ->
  console.log browser.error.stack if browser.error?

# Compile assets before running any integration specs
before (done) ->
  exec 'cake assets:fast', (err, stdout, stderr) ->
    console.log stdout
    done()

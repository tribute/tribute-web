require "./common.coffee"
browser = require 'zombie'
fs = require 'fs'
exec = require('child_process').exec
sinon = require 'sinon'

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
    
    # Helper function to pick out an ajax request made by the browser
    browser.findRequest = (method, urlRegex) ->
      _.last((arg for arg in browser.window.$.ajax.args \
        when arg[0].type is method and arg[0].url.match(urlRegex)))?[0]
    
    browser.wait ->
      browser.window.$ ->
        sinon.spy browser.window.$, 'ajax'
        callback browser
      
beforeEach? (done) ->
  module.exports.setupBrowser (@browser) => done()

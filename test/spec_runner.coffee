_ = require 'underscore'
_.mixin require 'underscore.string'
glob = require 'glob'
fs = require 'fs'

testDirs = (dir for dir in fs.readdirSync(__dirname) when not dir.match /\.|helpers|config/)
testFiles = _.flatten (glob.sync(__dirname + '/' + dir + '/**/*.coffee') for dir in testDirs)
testFiles = (file for file in testFiles when file.match /_spec.coffee$/)
require(file) for file in testFiles
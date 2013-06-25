global.nap = require 'nap'

nap
  mode: if app.settings.env is 'development' then 'development' else 'production'
  assets: require './assets'
  gzip: app.settings.env is 'production'

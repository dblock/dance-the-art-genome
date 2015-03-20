express = require 'express'
sharify = require 'sharify'
path = require 'path'
fs = require 'fs'
artsyXappMiddleware = require './xapp-middleware'

module.exports = (app) ->

  # Inject some configuration & constant data into sharify
  sd = sharify.data =
    ARTSY_API_URL: process.env.ARTSY_API_URL
    NODE_ENV: process.env.NODE_ENV
    JS_EXT: (if 'production' is process.env.NODE_ENV then '.min.js' else '.js')
    CSS_EXT: (if 'production' is process.env.NODE_ENV then '.min.css' else '.css')

  # Mount sharify
  app.use sharify

  # Development only
  if 'development' is sd.NODE_ENV
    # Compile assets on request in development
    app.use require('stylus').middleware
      src: path.resolve(__dirname, '../')
      dest: path.resolve(__dirname, '../public')
    app.use require('browserify-dev-middleware')
      src: path.resolve(__dirname, '../')
      transforms: [require('jadeify'), require('caching-coffeeify')]

  console.log "Artsy API at #{process.env.ARTSY_API_URL} ..."

  # Artsy API
  app.use artsyXappMiddleware
    apiUrl: process.env.ARTSY_API_URL
    clientId: process.env.ARTSY_API_CLIENT_ID
    clientSecret: process.env.ARTSY_API_CLIENT_SECRET

  # Mount apps
  app.use require '../apps/dance'
  app.use require '../apps/electronica'
  app.use require '../apps/algorithms'

  # Mount static middleware for sub apps, components, and project-wide
  fs.readdirSync(path.resolve __dirname, '../apps').forEach (fld) ->
    app.use express.static(path.resolve __dirname, "../apps/#{fld}/public")
  app.use express.static(path.resolve __dirname, '../public')

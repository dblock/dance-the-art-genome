express = require "express"
setup = require "./lib/setup"
env = require 'node-env-file'

env __dirname + '/.env'
app = module.exports = express()
setup app

# Start the server and send a message to IPC for the integration test
# helper to hook into.
app.listen process.env.PORT, ->
  console.log "Listening on port " + process.env.PORT
  process.send? "listening"

express = require "express"
routes = require "./routes"

app = module.exports = express()
app.set "views", __dirname + "/templates"
app.set "view engine", "jade"
app.get "/algorithms", routes.index
app.get "/algorithms/about", routes.about

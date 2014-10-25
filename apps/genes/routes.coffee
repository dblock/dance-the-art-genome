sd = require("sharify").data
artsyXappMiddleware = require '../../lib/xapp-middleware'

@index = (req, res, next) ->
  res.render "index"

@genes = (req, res) ->
  traverson = require('traverson')
  api = traverson.jsonHal.from(sd.ARTSY_API_URL)
  api.newRequest()
    .follow('genes')
    .withRequestOptions(
      headers:
        'X-Xapp-Token': artsyXappMiddleware.token,
        'Accept': 'application/vnd.artsy-v2+json'
    ).getResource (err, genes) ->
      res.json genes._embedded.genes

request = require 'superagent'
moment = require 'moment'

module.exports.token = null

module.exports = (options) =>

  fetch = (callback) =>
    request.post(options.apiUrl + '/tokens/xapp_token').send(
      client_id: options.clientId,
      client_secret: options.clientSecret
    ).end (err, res) =>
      return callback err if err || res.body.token?.length == 0
      console.log "Fetched Artsy API XAPP token, #{res.body.token.length} byte(s)."
      callback null, res.body.token
      expireTokenIn res.body.expires_at

  expireTokenIn = (expiresIn) =>
    setTimeout (=> module.exports.token = null), moment(expiresIn).unix() - moment().unix()

  (req, res, next) =>
    unless module.exports.token?
      fetch (err, token) =>
        res.locals.artsyXappToken = module.exports.token = token
        next()
    else
      res.locals.artsyXappToken = module.exports.token
      next()

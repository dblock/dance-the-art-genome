$ = require 'jquery'
sd = require("sharify").data
_ = require 'underscore'

$ ->
  $.get '/genes', (genes) ->
    names = _.map genes, (gene) -> "#{gene.name}: #{gene.description}"
    $('#js-rotating').text(names.join('|'))
    $('#js-rotating').Morphext
      separator: '|'
      animation: "bounceIn"
      speed: 2000

sd = require("sharify").data
_ = require 'underscore'

require '../../lib/vendor/typetype/jquery.typetype.coffee'

dance = (genes, durations) ->
  return if _.isEmpty(durations)
  return if _.isEmpty(genes)

  duration = _.first(durations)
  gene = _.sample genes

  $('textarea').fadeOut 400, ->
    $('textarea').val('')
    $('textarea').fadeIn 400, ->
      $('textarea').typetype "#{gene.name}, #{gene.artworks_count} artworks, #{gene.artists_count} artists",
        callback: ->
          setTimeout ->
            dance _.without(genes, gene), _.rest(durations)
          , duration * 100

$ ->

  $.getJSON "/data/algorithms/genes.json", (genes) ->

    total_minutes = 15
    slow_changes_per_minute = 3
    max_changes_per_minute = 10

    movements = [
      23, 22, 21, # minute 1
      20, 20, 20, # nine minutes, from 20 seconds (3 per minute) down to 6 (10 per minute)
      19, 19, 19, 19,
      18, 18, 18, 18,
      17, 17, 17, 17,
      16, 16, 16,
      15, 15, 15,
      14, 14, 14,
      13, 13, 13,
      12, 12,
      11, 11,
      10, 9,
      9, 9, 9,
      8, 8, 8,
      7, 7, 7,
      6, 6, 6,
      17, 17, 17, # last 5 minutes
      18, 18, 18,
      19, 19, 19,
      20, 20, 20,
      21, 21,
      22
    ]

    dance genes, movements


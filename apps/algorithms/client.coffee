sd = require("sharify").data
_ = require('underscore')
Packery = require('packery')

maxGeneCount = 100

about = ->
  window.location = '/algorithms/about'

dance = (genes, durations) ->
  return about() if _.isEmpty(durations) || _.isEmpty(genes)

  duration = _.first(durations)
  gene = _.sample genes

  relativeSize = 400 + 1000 * (gene.artworks_count + gene.artists_count) / maxGeneCount
  rotation = _.random(0, 360)

  $count = null

  $('textarea').fadeOut 400, ->
    $('textarea')
      .val("#{gene.name}")
      .css('font-size', "#{relativeSize}%")
      .css('transform', "rotate(#{rotation}deg)")

    $("#artworks_count_#{gene.artworks_count}")
      .addClass('selected')
      .hide()
      .fadeIn 400, ->
      $("#artists_count_#{gene.artists_count}")
        .addClass('selected')
        .fadeIn 400
        .hide()

    $('textarea').fadeIn 400, ->
      setTimeout ->
        dance _.without(genes, gene), _.rest(durations)
      , duration * 10

getMaxGeneCount = (genes) ->
  max_gene = _.max genes, (gene) -> gene.artworks_count + gene.artists_count
  max_gene.artworks_count + max_gene.artists_count

fillNumbers = (genes) ->
  $numbers = $('#numbers')

  _.each genes, (gene) ->

    relativeSize = 150 + 1000 * gene.artworks_count / maxGeneCount
    rotation = _.random(0, 360)
    number = $("<div class='number' id='artworks_count_#{gene.artworks_count}'>#{gene.artworks_count}</div>")
    number
      .css('transform', "rotate(#{rotation}deg)")
      .css('font-size', "#{relativeSize}%")

    $numbers.append(number)

    relativeSize = 150 + 1000 * gene.artists_count / maxGeneCount
    rotation = _.random(0, 360)
    number = $("<div class='number' id='artists_count_#{gene.artworks_count}'>#{gene.artists_count}</div>")
    number
      .css('transform', "rotate(#{rotation}deg)")
      .css('font-size', "#{relativeSize}%")

    $numbers.append(number)


  new Packery('#numbers', { itemSelector: '.number', gutter: 20 })

  $numbers.css('position', 'absolute')

$ ->

  $.getJSON "/data/algorithms/genes.json", (genes) ->

    total_minutes = 15
    slow_changes_per_minute = 3
    max_changes_per_minute = 10

    maxGeneCount = getMaxGeneCount(genes)
    fillNumbers(genes)

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


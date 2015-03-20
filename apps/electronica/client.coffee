sd = require("sharify").data
_ = require 'underscore'
marked = require 'marked'

$ ->
  $.get '/electronica/genes', (genes) ->
    names = _.map genes, (gene) -> "#{gene.name}: #{gene.description}"
    setTimeout ->
      $('h1').addClass('flicker')
      changeGene = ->
        $('h1').removeClass('flicker')
        gene = _.sample(genes)
        link = gene._links.permalink.href
        $('h1').html "<a href=\"#{link}\" target=\"_blank\">#{gene.name}</a>"
        $('h2').html marked gene.description
      setInterval changeGene, 10000
      setTimeout changeGene, 2000
    , 2000
  setInterval (-> _.times 10, ((i)-> setTimeout makeGeometry, 100 * i)), 800

makeGeometry = ->
  $('body').append $geo = $("<div class='geometry'></div>")
  translate = -> "translate3d(\
    #{_.random($(window).width()) - ($(window).width() / 2)}px,\
    #{_.random($(window).height()) - ($(window).height() / 2)}px,\
    0)"
  css =
    width: size = _.random($(window).width())
    height: size
    'transform': translate()
    'border-left': if _.random(1) is 1 then '1px solid white' else ''
    'border-right': if _.random(1) is 1 then '1px solid white' else ''
    'border-bottom': if _.random(1) is 1 then '1px solid white' else ''
    'border-top': if _.random(1) is 1 then '1px solid white' else ''
    opacity: Math.random()
  css['border-radius'] = '1000px' if _.random(1) is 1
  $geo.css css
  setTimeout -> $geo.css
    'transform': translate() + " rotate(#{_.random(360)}deg)"
    opacity: Math.random()
  , 100
  setTimeout (-> $geo.remove()), 800

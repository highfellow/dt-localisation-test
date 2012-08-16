{ Template, jqueryify } = window.dynamictemplate
{ Adapter } = require './localise.coffee'
{ floor, random } = Math

tpl = new Template schema:'html5', ->
  @$div ->
    @$h1 'data-dt-l10n-id': 'title', "The adventures of two small furry creatures"
    @$span 'data-dt-l10n-id': 'story', "The quick brown fox jumped over the lazy dog"
localise = new Adapter tpl

#tpl.ready ->
#  for el in tpl.jquery
#    $('body').append el


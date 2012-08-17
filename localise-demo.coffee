{ Template, jqueryify } = window.dynamictemplate
localise = require './localise.coffee'
{ floor, random } = Math

tpl = new Template schema:'html5', ->
  @$div ->
    @$h1 'data-dt-l10n-id': 'title', "The adventures of two small furry creatures"
    @$span 'data-dt-l10n-id': 'story', "The quick brown fox jumped over the lazy dog"

console.log tpl
jq = jqueryify localise tpl
console.log jq

jq.ready ->
  console.log "ready"
  for el in jq.jquery
    $('body').append el


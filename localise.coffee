
EVENTS = [
  'add', 'end'
  'show', 'hide'
  'attr','text', 'raw'
  'remove', 'replace'
]

class LocaliseAdapter
  constructor: (@template, opts = {}) ->
    @listen()
  listen: () ->
    for event in EVENTS
      listener = if event is 'text' then @ontext else (args...)->
        @onother event, args...
      @template.on(event, listener.bind(this))
  ontext: (el, text) ->
    console.log "event: text", el, text
  onother: (event, args...) ->
    console.log "event: ", event, args...

module.exports = {
  Adapter: LocaliseAdapter
}

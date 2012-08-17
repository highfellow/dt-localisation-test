{ EventEmitter } = require 'events'

# events on template to listen for
EVENTS = [
  'add', 'end'
  'show', 'hide'
  'attr','text', 'raw'
  'remove', 'replace'
]

# template methods to reproduce.
METHODS = [
  'register', 'remove'
  'end', 'ready'
  'show', 'hide'
]

makeListener = (event) ->
  return (args...) =>
    console.log "event: ", event, args...
    @emit event, args...

makeMethod = (method) ->
  return (args...) ->
    console.log "method: ", method, args...
    @template[method] args...
     
class LocaliseAdapter extends EventEmitter
  constructor: (@template, opts = {}) ->
    @xml = @template.xml
    # pass methods back to template.
    for method in METHODS
      this[method] = makeMethod.call(this,method)
    @listen()
    return this
  toString: () ->
    "[Object LocaliseAdapter]"
  listen: () ->
    for event in EVENTS
      listener = if event is 'text' then @ontext else makeListener.call(this, event)
      @template.on(event, listener.bind(this))
  ontext: (el, text) =>
    console.log "event: text", el, text
    l10nId = el?.attrs?['data-dt-l10n-id']
    if l10nId?
      @emit 'text', el, "[#{l10nId}] #{text}"
    else
      @emit 'text', el, text
  onother: (event, args...) =>

localise = (opts, tpl) ->
  [tpl, opts] = [opts, null] unless tpl?
  return new LocaliseAdapter(tpl, opts)

# exports
#
#localise.fn = defaultfn
localise.Adapter = LocaliseAdapter
module.exports = localise
 

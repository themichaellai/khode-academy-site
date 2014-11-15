class RubyEngine
  constructor: ->
    Ruby.initialize(null, @out, @error)

  # returns [val:String, latestOutput:string]
  # val is string of returned value from #eval call
  # latestOutput is anything written to stdout in #eval call
  eval: (code) ->
    try
      val = Ruby.eval(code)
    @readBuffer()
    [Ruby.stringify(val), @latestOutput]

  out: (character) =>
    @buffer.push(String.fromCharCode(character)) if character?

  error: (character) =>
    @buffer.push(String.fromCharCode(character)) if character?

  buffer: []
  latestOutput: ""
  readBuffer: ->
    bufferCopy = @buffer
    @buffer = []
    bufferString = bufferCopy.join("")
    @latestOutput = bufferString

window.RubyEngine = new RubyEngine


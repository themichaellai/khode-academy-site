class RubyEngine
  constructor: ->
    Ruby.initialize(null, @out, @error)

  eval: (code) ->
    try
      val = Ruby.eval(code)
    @readBuffer()
    console.log(@latestOutput) if @latestOutput
    console.log Ruby.stringify val

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


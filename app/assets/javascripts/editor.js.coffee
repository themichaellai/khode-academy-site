# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
myCodeMirror = undefined
window.onload = ->
  myTextArea = document.getElementById("codeBox")
  myCodeMirror = CodeMirror((elt) ->
    myTextArea.parentNode.replaceChild elt, myTextArea
    return
  ,
    value: window.boilerplate_code
    theme: "solarized dark"
    tabSize: 2
    lineWrapping: false
    lineNumbers: true
  )
  # Following line converts tab characters to spaces:
  myCodeMirror.setOption "extraKeys",
    Tab: (cm) ->
      spaces = Array(cm.getOption("indentUnit") + 1).join(" ")
      cm.replaceSelection spaces
      return
  myCodeMirror.setSize null, null
  document.getElementById("printButton").onclick = ->
    user_code = myCodeMirror.getValue()
    [val, output] = RubyEngine.eval(user_code)
    console.log val
    console.log output if output
    return

  return

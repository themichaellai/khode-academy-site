# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.myCodeMirror = undefined
window.onload = ->
  if document.getElementById("lesson-form")
    $("#lesson-form").submit (event) ->
      $("input[name=\"lesson[boilerplate_code]\"]").val window.myCodeMirror.getValue()
      return

  myTextArea = document.getElementById("codeBox")
  window.myCodeMirror = CodeMirror((elt) ->
    myTextArea.parentNode.replaceChild elt, myTextArea
    return
  ,
    value: window.boilerplate_code ||= ""
    theme: "solarized dark"
    tabSize: 2
    lineWrapping: false
    lineNumbers: true
  )
  # Following line converts tab characters to spaces:
  window.myCodeMirror.setOption "extraKeys",
    Tab: (cm) ->
      spaces = Array(cm.getOption("indentUnit") + 1).join(" ")
      cm.replaceSelection spaces
      return
  window.myCodeMirror.setSize null, null
  if document.getElementById("printButton")
    document.getElementById("printButton").onclick = ->
      user_code = window.myCodeMirror.getValue()
      [val, output] = RubyEngine.eval(user_code)
      console.log val
      console.log output if output
      return

  return

  

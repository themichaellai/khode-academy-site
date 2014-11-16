# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.myCodeMirror = undefined
if ! window.onload
  window.onload = -> 
    return 
fun = window.onload
window.onload = ->
  fun()
  if document.getElementById("lesson-form")
    $("#lesson-form").submit (event) ->
      $("input[name=\"lesson[boilerplate_code]\"]").val window.myCodeMirror.getValue()
      $("input[name=\"lesson[instructions]\"]").val window.mdInstruction.getContent()
      $("input[name=\"lesson[lesson_text]\"]").val window.mdLessonText.getContent()
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
      data = {
        user_code: user_code
        class_name: "Asdf"
        cases: [
          {
            name: "faile me",
            code: "1 + 1 == 2"
          }
        ]
      }
      $.ajax(
        url: '/check/ruby'
        data: JSON.stringify(data)
        type: 'POST'
        contentType: 'application/json'
      )
      .done (res) ->
        console.log('res', res)
      .fail (e) ->
        console.log(e)
      return

  return

  

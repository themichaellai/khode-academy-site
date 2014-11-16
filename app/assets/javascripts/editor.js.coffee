didPass = (text) ->
  /0 failures/.test(text)

getFailures = (text) ->
  match = /Failures:([\s\S]*?)Finished/gm.exec(text)
  match[1].trim()

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
            code: "1 + 1 == 3"
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
        if didPass(res)
          console.log('passed')
        else
          $('.output').text(getFailures(res))
      .fail (e) ->
        console.log(e)
      return

  return

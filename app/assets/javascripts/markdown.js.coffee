window.mdInstruction = undefined
window.mdLessonText = undefined
if ! window.onload
  window.onload = -> 
    return 
fun = window.onload
window.onload = ->
  fun()
  if document.getElementById("mdInstruction")
    $("#mdInstruction").markdown({
      fullscreen: {enable: false},
      width: 500,
      onFocus: (e) ->
        window.mdInstruction = e
    })
  if document.getElementById("mdLessonText")
    $("#mdLessonText").markdown({
      fullscreen: {enable: false},
      width: 500
      onFocus: (e) ->
        window.mdLessonText = e
    })

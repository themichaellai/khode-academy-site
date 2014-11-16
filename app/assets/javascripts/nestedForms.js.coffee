$(document).ready ->
  
  $("select").change ->
    processTests()


  if $('.duplicatable_nested_form').length

    nestedForm = $('.duplicatable_nested_form').last().clone()


  
    $('.duplicate_nested_form').click (e) ->
      e.preventDefault()

      lastNestedForm = $('.duplicatable_nested_form').last()
      newNestedForm  = $(nestedForm).clone()
      formsOnPage    = $('.duplicatable_nested_form').length

      $(newNestedForm).find('label').each ->
        oldLabel = $(this).attr 'for'
        newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
        $(this).attr 'for', newLabel

      $(newNestedForm).find('select, input, textarea').each ->
        oldId = $(this).attr 'id'
        newId = oldId.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
        $(this).attr 'id', newId

        oldName = $(this).attr 'name'
        newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[#{formsOnPage}]")
        $(this).attr 'name', newName

      $( newNestedForm ).insertAfter( lastNestedForm )

      $("select").change ->
        processTests()


processTests = ->
  numSelects = document.getElementsByTagName("select").length
  i = 0

  while i < numSelects
    type = document.getElementById("lesson_tests_attributes_" + i + "_test_type").value
    if type is "expect"
      $("#lesson_tests_attributes_" + i + "_arg_b").show()
    else if type is "regex"
      $("#lesson_tests_attributes_" + i + "_arg_b").hide()
      $("#lesson_tests_attributes_" + i + "_arg_b").val('')
    else # output
      $("#lesson_tests_attributes_" + i + "_arg_b").hide()
      $("#lesson_tests_attributes_" + i + "_arg_b").val('')
    i++
  return

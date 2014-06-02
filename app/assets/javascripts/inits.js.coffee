$(".datepicker").pickadate
  clear: ''


$('.collapse').collapse()


sprints = () ->
  location.href="/sprints"

sprintsNew = () ->
  location.href="/sprints/new"
sprintEdit = () ->
  location.href += "/edit"



showIterations = () ->
  if $('#burn-show').is(":visible")
    $("#burn-show").fadeToggle ->
      $("#burn-edit").fadeToggle()
      return

  if $('#burn-edit').is(":visible")
    $("#burn-edit").fadeToggle ->
      $("#burn-show").fadeToggle()
      return

$(document).bind "keyup", "s", sprints
$(document).bind "keyup", "n", sprintsNew
$(document).bind "keyup", "e", sprintEdit
$(document).bind "keyup", "i", showIterations

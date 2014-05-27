$(".datepicker").pickadate
  clear: ''
  
  
$('.collapse').collapse()  


sprints = () ->
  location.href="/sprints"

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
$(document).bind "keyup", "i", showIterations


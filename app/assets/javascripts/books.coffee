$(document).ready ->
  $ ->
    $(".input-link-plus").click (e) ->
      e.preventDefault()
      addItem = parseInt($("#quantity").val(),10) + 1
      $("#quantity").val(addItem)

    $(".input-link-minus").click (e) ->
      e.preventDefault()
      subtractItem = parseInt($("#quantity").val(),10) - 1
      lessThanOne = $("#quantity").val() <= 1
      $("#quantity").val(subtractItem)
      $("#quantity").val(if lessThanOne then "1" else subtractItem)

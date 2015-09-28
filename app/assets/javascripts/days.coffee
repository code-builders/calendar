$ ->
  picker = new Pikaday {
    field: $(".date-picker")[0],
    format: "YYYY-MM-DD"
  }

  $(".show").click ->
    sel = $(this).data('target')
    $(sel).toggle()

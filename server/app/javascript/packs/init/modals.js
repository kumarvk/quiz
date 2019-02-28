// Whenever a modal is shown, focus the input field marked with 'autofous' if one exists
$(document).on('shown.bs.modal', function (event) {
  $('[autofocus]', event.target).focus()
})

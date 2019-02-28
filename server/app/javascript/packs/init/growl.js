growl = function(type, message) {
  $('.flash').hide();

  if (type === 'Alert')
    return $.growl({ title: type, message: message });

  if (type === 'Warning')
    return $.growl.warning({ title: type, message: message });

  if (type === 'Error')
    return $.growl.error({ title: type, message: message });

  return $.growl.notice({ title: type, message: message });
}

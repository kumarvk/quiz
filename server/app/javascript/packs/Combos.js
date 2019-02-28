class Combos {
  init() {
    $(() => {
      this.injectToPage()
    });
  }

  injectToPage(modalSelector = false) {
    let opts = {
      minimumResultsForSearch: 10
    };
    let selector = 'select';
    if (modalSelector) {
      Object.assign(opts, {dropdownParent: $(modalSelector)});
      selector = modalSelector + ' ' + selector;
    }
    $(selector).each(function() {
      let el = $(this);
      let allowClear = el.data('allowClear');
      let opts1 = opts;
      if (allowClear) opts1 = Object.assign({allowClear: true, placeholder: '- SELECT -'}, opts);
      el.prev('label').click(() => {
        el.select2('focus');
      });
      el.select2(opts1);
    });
  }
}

let x = new Combos();

export default x;
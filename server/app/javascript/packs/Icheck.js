class Icheck {
  init() {
    $(() => {
      this.injectToPage()
    });
  }

  injectToPage(modalSelector = false) {
    let selector = 'input';
    if (modalSelector) {
      selector = modalSelector + ' ' + selector;
    }
    $(selector).iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue',
      increaseArea: '20%' // optional
    });
  }
}

let x = new Icheck();

export default x;
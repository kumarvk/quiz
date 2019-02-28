import Combos from './Combos';

class Cocoon {
  processPage(modalSelector = false) {
    $('#guests')
      .on('cocoon:after-insert', function() {
        Combos.injectToPage(modalSelector)
      })
  }
}

let x = new Cocoon();

export default x;


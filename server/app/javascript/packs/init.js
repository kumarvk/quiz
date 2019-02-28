import Turbolinks from 'turbolinks'
import './init/growl'
import './init/main'
import './init/modals'
import Combos from './Combos'
import Icheck from './Icheck'
import Cocoon from './Cocoon'
import initReactComponents from './react/ReactComponents'

export function init() {
  Turbolinks.start()
  Combos.init()

  window.Combos = Combos
  window.Cocoon = Cocoon
  window.Icheck = Icheck

  initReactComponents()
}

# frozen_string_literal: true

module JSHelpers

  def ss(no = 0)
    page.save_screenshot "spec/_debug_screenshots/#{no}.png", full: true
  end

  def wait_js(n = 1)
    n.times { sleep 0.3 }
  end

end

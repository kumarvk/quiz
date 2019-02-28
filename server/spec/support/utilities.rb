# frozen_string_literal: true

def link_css(href, method)
  "a[href='#{href}'][data-method=#{method}]"
end

def modal_css(id)
  "div.modal.fade##{id} div.modal-dialog div.modal-content div.modal-body"
end

def remote_link_css(path)
  "a[data-remote=true][href='#{path}']"
end

def create_one_of_each_status(klass, options = {})
  klass::ALL_STATUSES.each do |status|
    options[:status] = status
    FactoryGirl.create(klass.to_s.downcase.to_sym, options)
  end
end

def modal_selector
  'div.modal.fade .modal-body'
end

def open_modal(link_selector)
  click_link link_selector
  expect(page).to have_css(modal_selector)
  within(modal_selector) do
    if block_given?
      yield
    else
      expect(page).to have_css('form')
    end
  end
end

def submit_modal(btn_selector, success_message = _('Your changes have been saved'))
  click_button(btn_selector)
  expect(page).not_to have_css('modal.fade.in')
  expect(page).to have_content success_message if success_message
end

def scroll_to_el(element)
  script = <<-JS
      arguments[0].scrollIntoView(true);
  JS

  Capybara.current_session.driver.browser.execute_script(script, element.native)
end

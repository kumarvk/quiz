# frozen_string_literal: true

require 'support/object_creators/user.rb'
require 'support/form_fillers/user.rb'

def sign_in(user = create_user, expect_success = true)
  visit root_path
  open_modal(_('Sign in'))
  fill_in_new_user_session_form(user)
  click_button(_('Sign in'))
  if expect_success
    expect(page).to have_content(_('My account')) # test that user is really signed in
  else
    expect(page).to have_css('#error_explanation')
  end
end

def sign_out
  find('.my-account').click
  click_button _('Sign out')
  expect(page).not_to have_button(_('Sign out'))
end

# frozen_string_literal: true

def fill_in_new_user_registration_form(user, preceding_values = {})
  fill_in _('Enter your email address'), with: preceding_values[:email] || user.email
  fill_in _('Enter a password (%s characters minimum)') % 6, with: preceding_values[:password] || user.password
  fill_in _('Confirm your password'), with: preceding_values[:password_confirmation] || user.password
end

def fill_in_new_user_session_form(user, preceding_values = {})
  fill_in _('Enter your email address'), with: preceding_values[:email] || user.email
  fill_in _('Enter your password'), with: preceding_values[:password] || user.password
end

def fill_in_edit_password_form(data)
  fill_in _('New password'), with: data[:password]
  fill_in _('Confirm new password'), with: data[:password_confirmation] || data[:password]
end

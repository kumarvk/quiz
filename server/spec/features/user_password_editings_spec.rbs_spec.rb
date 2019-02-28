# frozen_string_literal: true

require 'rails_helper'
require 'support/user_sessions_helpers'

RSpec.feature 'UserPasswordEditings', type: :feature do

  let(:user) { FactoryGirl.create(:user) }

  def fill_in_password_form(old_password = 'foobar', new_password = 'foobar1')
    fill_in _('My current password'), with: old_password
    fill_in _('New password'), with: new_password
    fill_in _('Confirm new password'), with: new_password
  end

  context 'when JS is enabled', js: true do
    before do
      sign_in user
      visit my_profile_path
      click_link _('Change password')

      wait_js

      # should open a modal, hence the path should not have changed
      expect(page.current_path).to eq my_profile_path
    end

    scenario 'change to a valid password' do
      # fill in form and submit
      fill_in_password_form 'foobar', 'foobar1'
      click_button _('Change password')

      wait_js

      # the modal-body-content should now be replaced with the success message
      expect(page.current_path).to eq my_profile_path
      expect(page).to have_css('.modal.in .modal-body', text: _('Your password has been successfully changed'))

      # make sure the new password was saved
      find('.modal').click # the modal needs to be closed to yield the sign out button
      sign_out
      user.password = 'foobar1'
      sign_in user
      expect(page).to have_content(_('My account'))
    end

    scenario 'try to change to an invalid password first' do
      # fill in form and submit
      fill_in_password_form 'foobar', 'f'
      click_button _('Change password')

      wait_js

      # the modal-body-content should now show an error message
      expect(page.current_path).to eq my_profile_path
      within('.modal.in .modal-body') do
        expect(page).to have_content('New password is too short')
      end

      # fill in form with a valid new password and submit
      fill_in_password_form 'foobar', 'foobar1'
      click_button _('Change password')

      wait_js

      # make sure the new password was saved
      find('.modal').click # the modal needs to be closed to yield the sign out button
      sign_out
      user.password = 'foobar1'
      sign_in user
      expect(page).to have_content(_('My account'))
    end
  end

end

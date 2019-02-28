# frozen_string_literal: true

require 'rails_helper'
require 'support/object_creators/user'
require 'support/form_fillers/user'

RSpec.feature 'UserSignIns', type: :feature do

  subject { page }

  let(:sign_in_button_name) { _('Sign in') }
  let(:user) { create_user }

  before { visit new_user_session_path }

  context 'with valid data' do
    before do
      fill_in_new_user_session_form(user)
      click_button(sign_in_button_name)
    end

    # makes sure the devise standard success message is not present
    it { is_expected.not_to have_content _('Signed in successfully.') }

    it 'redirects to root_path' do
      expect(page.current_path).to eq root_path
    end

    it 'signs the user in' do
      expect(page).to have_button(_('Sign out'))
    end
  end

  context 'when omitting the email field' do
    before do
      fill_in_new_user_session_form(user, email: '')
      click_button(sign_in_button_name)
    end

    it { is_expected.to have_content _('Invalid email or password.') }
  end

end

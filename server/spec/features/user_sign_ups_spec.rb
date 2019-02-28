# frozen_string_literal: true

require 'rails_helper'
require 'support/object_creators/user'
require 'support/form_fillers/user'
require 'support/mailer_macros'

RSpec.feature 'UserSignUps', type: :feature do

  subject { page }

  let(:sign_up_button_name) { _('Create account') }
  let(:user) { build_user }
  let(:confirmation_instructions_email_subject) { 'Confirm your account' }

  before { visit new_user_registration_path }

  context 'with valid data' do
    before do
      fill_in_new_user_registration_form(user)
      click_button(sign_up_button_name)
    end

    # makes sure the devise standard success message is not present
    it { is_expected.not_to have_content _('Welcome! You have signed up successfully.') }

    it 'redirects to sign_up_unconfirmed_path' do
      expect(page.current_path).to eq sign_up_unconfirmed_path
    end

    it 'saves the unconfirmed user to the database' do
      last_saved_user = User.find_by(email: user.email)
      expect(last_saved_user.nil?).to eq false
      expect(last_saved_user.confirmed?).to eq false
    end

    it 'sends a confirmation mail to the user' do
      expect(how_many_emails_to(user.email, confirmation_instructions_email_subject)).to eq 1
    end
  end

  context 'when omitting password confirmation' do
    before do
      fill_in_new_user_registration_form(user, password_confirmation: '')
      click_button(sign_up_button_name)
    end

    it { is_expected.to have_content _("Password confirmation doesn't match") }
  end

  context 'when omitting password' do
    before do
      fill_in_new_user_registration_form(user, password: '')
      click_button(sign_up_button_name)
    end

    it { is_expected.to have_content _("Password can't be blank") }
  end

  context 'when omitting email' do
    before do
      fill_in_new_user_registration_form(user, email: '')
      click_button(sign_up_button_name)
    end

    it { is_expected.to have_content _("Email can't be blank") }
  end

  context 'when password is too short' do
    before do
      user.password = 'f'
      fill_in_new_user_registration_form(user)
      click_button(sign_up_button_name)
    end

    it { is_expected.to have_content _('Password is too short') }
  end

end

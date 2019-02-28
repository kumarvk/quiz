# frozen_string_literal: true

require 'rails_helper'
require 'support/object_creators/user'
require 'support/devise_helpers'
require 'support/form_fillers/user'

RSpec.feature 'PasswordResets', type: :feature do

  subject { page }

  let(:user) { create_user }
  let(:token) { set_devise_reset_password_token(user) }

  let(:click_submit) { click_button _('Change my password') }
  let(:success_message) { 'Your password has been changed successfully. You are now signed in.' }
  let(:new_password) { random_password }

  context 'token is valid' do

    before { visit edit_user_password_url(reset_password_token: token) }

    context 'passwords match' do
      before do
        fill_in_edit_password_form(password: new_password)
        click_submit
      end

      it { is_expected.to have_content success_message }
    end

    context "passwords don't match" do
      before do
        fill_in_edit_password_form(password: new_password, password_confirmation: new_password + 'a')
        click_submit
      end

      it { is_expected.not_to have_content success_message }
      it { is_expected.to have_content _("Password confirmation doesn't match Password") }
    end

    context 'password too short' do
      before do
        fill_in_edit_password_form(password: new_password[0, 1])
        click_submit
      end

      it { is_expected.not_to have_content success_message }
      it { is_expected.to have_content _('New password is too short') }
    end
  end

  context 'token is invalid' do

    before { visit edit_user_password_url(reset_password_token: token + 'a') }

    context 'passwords match' do
      before do
        fill_in_edit_password_form(password: new_password)
        click_submit
      end

      it { is_expected.not_to have_content success_message }
    end
  end

end

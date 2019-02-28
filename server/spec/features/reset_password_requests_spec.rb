# frozen_string_literal: true

require 'rails_helper'
require 'support/mailer_macros'
require 'support/random_items'
require 'support/object_creators/user'

RSpec.feature 'ResetPasswordRequests', type: :feature, js: true do

  subject { page }

  let(:submit_button_name) { _('Send') }

  before do
    reset_email
    visit root_path
    open_modal(_('Forgot your password?'))
  end

  context 'email is valid' do
    context 'a user with this email exists' do
      let(:email) { create_user.email }

      before do
        fill_in 'user_email', with: email
        click_button(submit_button_name)
        expect(page).to have_content(_("We've sent you password reset instructions"))
      end

      it 'sends a reset_password_instructions email to the given email address' do
        expect(how_many_emails_to(email, _('Reset your password'))).to eq 1
      end
    end

    context 'no user with this email exists' do
      before do
        fill_in 'user_email', with: random_email
        click_button(submit_button_name)
        expect(page).to have_content(_('Email not found'))
      end

      it "doesn't send an email" do
        expect(how_many_emails_to).to eq 0
      end
    end
  end

  context 'email is invalid' do
    context 'email is blank' do
      before do
        click_button(submit_button_name)
        expect(page).to have_content(_("Email can't be blank"))
      end

      it "doesn't send an email" do
        expect(how_many_emails_to).to eq 0
      end
    end
  end

end

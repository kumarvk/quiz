# frozen_string_literal: true

require 'rails_helper'
require 'support/object_creators/user'

RSpec.feature 'EmailConfirmations', type: :feature do

  subject { page }

  let(:user) { create_unconfirmed_user }
  let(:token) { set_devise_email_confirmation_token(user) }

  let(:success_message) { 'Your email address has been successfully confirmed.' }

  context 'token is valid' do

    before { visit user_confirmation_url(confirmation_token: token) }

    it { is_expected.not_to have_content success_message }

    it 'redirects to sign_up_success_path' do
      expect(page.current_path).to eq sign_up_success_path
    end
  end

  context 'token is invalid' do

    before { visit user_confirmation_url(confirmation_token: token + 'a') }

    it { is_expected.not_to have_content success_message }
  end

end

# frozen_string_literal: true

require 'rails_helper'
require 'support/user_sessions_helpers'

RSpec.feature 'UserSignOuts', type: :feature, js: true do

  subject { page }

  before do
    sign_in
    find('.main-header .my-account').click
    click_button _('Sign out')
  end

  # makes sure the devise standard success message is not present
  it { is_expected.not_to have_content 'Signed out successfully.' }

  it 'signs the user out' do
    visit root_path
    expect(page).not_to have_button(_('Sign out'))
  end

  it 'redirects to root_path' do
    expect(page.current_path).to eq root_path
  end

end

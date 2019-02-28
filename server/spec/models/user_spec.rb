# frozen_string_literal: true

require 'rails_helper'
require 'support/object_creators/user'

RSpec.describe User, type: :model do

  before { @user = build_user }

  subject { @user }

  it { is_expected.to respond_to :id }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :encrypted_password }
  it { is_expected.to respond_to :reset_password_token }
  it { is_expected.to respond_to :reset_password_sent_at }
  it { is_expected.to respond_to :created_at }
  it { is_expected.to respond_to :updated_at }
  it { is_expected.to respond_to :confirmation_token }
  it { is_expected.to respond_to :confirmed_at }
  it { is_expected.to respond_to :confirmation_sent_at }
  it { is_expected.to respond_to :unconfirmed_email }
  it { is_expected.to respond_to :sign_in_count }
  it { is_expected.to respond_to :current_sign_in_at }
  it { is_expected.to respond_to :last_sign_in_at }
  it { is_expected.to respond_to :current_sign_in_ip }
  it { is_expected.to respond_to :last_sign_in_ip }

  it { is_expected.to be_valid }

  describe 'when password is too short' do
    before { @user.password = 'a' * 5 }
    it { is_expected.not_to be_valid }
  end

  describe 'when email is not valid' do
    %w[haak@kaag kush@tush. lush(at)push.de @zaag.com lush@kush,de].each do |invalid_email|
      context "when email is #{invalid_email}" do
        before { @user.email = invalid_email }
        it { is_expected.not_to be_valid }
      end
    end
  end

end

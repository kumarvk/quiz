# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::Mailer, type: :mailer do

  subject { @mail }

  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:sender) { ['no-reply@my-project.com'] }

  describe '#confirmation_instructions' do
    before { @mail = Devise::Mailer.confirmation_instructions(user, 'faketoken') }

    it 'has a matching subject' do
      expect(@mail.subject).to eq 'Confirm your account'
    end

    it 'has the right sender' do
      expect(@mail.from).to eq sender
    end

    it 'is addressed to the given user' do
      expect(@mail.to).to eq [user.email]
    end
  end

end

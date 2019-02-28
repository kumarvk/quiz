# frozen_string_literal: true

class Devise::MailerPreview < ActionMailer::Preview

  def confirmation_instructions
    user = FactoryGirl.build_stubbed(:user)
    Devise::Mailer.confirmation_instructions(user, 'faketoken')
  end

  def reset_password_instructions
    user = FactoryGirl.build_stubbed(:user)
    Devise::Mailer.reset_password_instructions(user, 'faketoken')
  end

end

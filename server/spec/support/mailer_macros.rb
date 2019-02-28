# frozen_string_literal: true

def reset_email
  ActionMailer::Base.deliveries = []
end

def how_many_emails_to(email = nil, subject = nil)
  return ActionMailer::Base.deliveries.length unless email

  sent_mails = 0
  ActionMailer::Base.deliveries.each do |mail|
    # puts mail.subject
    if mail.to.include?(email) && mail.subject == (subject || mail.subject)
      sent_mails += 1
    end
  end
  sent_mails
end

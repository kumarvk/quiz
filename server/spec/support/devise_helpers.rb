# frozen_string_literal: true

def resource_name
  :user
end

def resource
  @resource ||= User.new
end

def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end

def set_devise_reset_password_token(resource)
  raw, enc = Devise.token_generator.generate(resource.class, :reset_password_token)

  resource.reset_password_token = enc
  resource.reset_password_sent_at = Time.now.utc
  resource.save!(validate: false)

  raw
end

def set_devise_email_confirmation_token(resource)
  raw, enc = Devise.token_generator.generate(resource.class, :confirmation_token)

  resource.confirmation_token = enc
  resource.confirmation_sent_at = Time.now.utc
  resource.save!(validate: false)

  raw
end

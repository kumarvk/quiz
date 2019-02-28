# frozen_string_literal: true

require Rails.root.join('spec/support/random_items.rb')

# the create/build user functions are never admins!
def create_user(options = {})
  user = create_unconfirmed_user(options)
  user.confirm
  user
end

def create_unconfirmed_user(options = {})
  user = build_user(options)
  user.save!
  user
end

def build_user(options = {})
  User.new(random_user_attributes(options))
end

def random_user_attributes(options)
  defaults = {
    email: random_email,
    password: 'foobar'
  }

  defaults.merge!(options)
end


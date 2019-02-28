# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def ensure_user(email)
  user = User.find_by(email: email)
  unless user
    user = User.create(email: email, password: 'foobar')
    user.confirm
  end
  puts "User with email '#{email}' and password 'foobar' now exists."
  user
end

ensure_user('a@b.de')

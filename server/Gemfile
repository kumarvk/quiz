# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
gem 'webpacker', github: 'rails/webpacker'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Bootstrap fro styling
gem 'bootstrap-sass', '~> 3.3.5.1'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use font awesome for vector icons
gem 'font-awesome-rails', '~> 4.5', '>= 4.5.0.1'
# Use entypo icons
gem 'inline_svg'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# build nested forms
gem 'cocoon'

# Use Gettext rails for i18n
gem 'gettext_i18n_rails', '~> 1.2.3'
gem 'gettext', '~> 3.1.6', require: false, group: :development

# Use devise for user authentication
gem 'devise'

# Use puma as a webserver
gem 'puma', '~> 2.15', '>= 2.15.3'

gem 'rollbar'

# Colorize console output
gem 'colorize'

# Bootstrap styled Rails forms, incl. error messages
gem 'bootstrap_form'
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'

  # Testing
  gem 'rspec-rails'

  # Debugging and better IRB
  gem 'pry-rails'
  gem 'pry-stack_explorer'

  # Speed up tests
  gem 'parallel_tests'

  # Code analyzer for security issues
  gem 'brakeman'

  # Code style checker
  gem 'rubocop', require: false
  gem 'rubocop-rspec'

  # Guard gang for dev lifecycle tasks
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-shell'
  gem 'guard-brakeman'
  gem 'foreman' # this is not recommended by foreman itself, but without it guard-foreman doesn't want to work for me
  gem 'guard-foreman' # run all our dev server processes from guard

  # .env files support
  gem 'dotenv-rails'

  # retry unstable specs
  gem 'rspec-retry'
end

group :test do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara' # for rspec feature specs

  gem 'rails-controller-testing' # in Rails 5.0 controllers testing support migrated here

  # JS tests support
  gem 'poltergeist'

  # Chrome support for capybara
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'

  # Database cleanup between test cases
  gem 'database_cleaner'

  # stub outgoing connections
  gem 'webmock'

  # Code coverage
  gem 'simplecov', require: false
  gem 'simplecov-json', require: false

  # helpers for capybara to access select2
  gem 'capybara-select2'

end

group :production do
  gem 'rails_12factor' # requirement for heroku
end

# heroku recommends specifying the ruby version here
ruby '2.4.1'

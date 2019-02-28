# frozen_string_literal: true

if ENV['JS_TESTS_BROWSER'] == 'chrome'
  Capybara.server_port = 51_674 + ENV['TEST_ENV_NUMBER'].to_i
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
else
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist

  Capybara.register_driver :poltergeist do |app|
    options = {
      port: 51_674 + ENV['TEST_ENV_NUMBER'].to_i
    }
    Capybara::Poltergeist::Driver.new(app, options)
  end
end

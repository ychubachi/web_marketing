# -*- coding: utf-8 -*-

require 'spork'

Spork.prefork do
  require 'rubygems'
  
  require 'cucumber/rails'
  require 'database_cleaner'
  
  require 'email_spec' # add this line if you use spork
  require 'email_spec/cucumber'
  
  Capybara.default_selector = :css
  # Capybara.javascript_driver = :webkit #追加

  ActionController::Base.allow_rescue = false

  begin
    # DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.logger = Rails.logger
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
  DatabaseCleaner.clean
  FactoryGirl.reload
  Dir[Rails.root.join('app/**/*.rb')].each{ |file| load file }
end

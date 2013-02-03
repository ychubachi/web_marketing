# -*- coding: utf-8 -*-
require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true

    config.include(EmailSpec::Helpers)
    config.include(EmailSpec::Matchers)
  end

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation
end

Spork.each_run do
  DatabaseCleaner.clean
  
  # see: http://ja.asciicasts.com/episodes/285-spork
  FactoryGirl.reload
  
  # ここでrequireしたファイルは毎回リロードされます．
  # ただし，その分テストの起動は遅くなりますから注意．
  Dir[Rails.root.join('app/**/*.rb')].each{ |file| load file }
end




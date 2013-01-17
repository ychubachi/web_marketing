require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', '~> 0.8.8'
  when /mswin|windows|mingw32/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
    gem 'eventmachine', '>= 1.0.0.beta', :group => :development
end

gem "active_scaffold"
gem "bootstrap-sass"
gem "devise"
gem "haml"
gem "simple_form"
gem 'foreigner'
gem 'immigrant'
gem 'jquery-rails'
gem 'log4r'
gem 'rails'
gem 'sqlite3'
gem 'uuidtools'

group :development do
  gem "guard"
  gem "guard-bundler"
  gem "guard-livereload"
  gem "guard-rails"
  gem 'guard-spork'
  gem "haml-rails"
  gem "thin"
end

group :test do
  gem "capybara"
  gem "email_spec"
  gem "factory_girl_rails"
  gem "launchy"
  gem "machinist"
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'spork', '0.8.5'
  gem 'webrat'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem "therubyracer"
end

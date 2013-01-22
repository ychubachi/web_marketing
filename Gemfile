# ------------------------------------------------------------------------
# See: https://gist.github.com/1191428

gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form'

group :development do
  gem 'rails3-generators' # for factory_girl_rails and simple_form
end

group :test, :development do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'guard-bundler'
  gem 'guard-migrate'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'launchy'
  gem 'pry'
  gem 'rspec-instafail'
  # gem 'rspec-rails'
  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
end


# ------------------------------------------------------------------------
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

# ------------------------------------------------------------------------
group :test, :development do
  gem 'spork', '~> 1.0rc' # for its recent version.
  gem 'cucumber-rails', :require => false
  gem 'guard-cucumber'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'webrick'
  gem 'email_spec'
end

group :assets do
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'sass-rails'
  gem 'therubyracer'
  gem 'uglifier'
end

gem 'active_scaffold'
gem 'bootstrap-sass'
gem 'devise'
gem 'foreigner'
# gem 'immigrant' # version conflicts
gem 'log4r'
gem 'rails'
gem 'sqlite3'
gem 'uuidtools'

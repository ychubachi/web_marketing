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

gem 'active_scaffold'
gem 'bootstrap-sass'
gem 'devise'
gem 'foreigner'
gem 'haml-rails'
gem 'immigrant'
gem 'jquery-rails'
gem 'log4r'
gem 'rails'
gem 'simple_form'
gem 'sqlite3'
gem 'uuidtools'

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :development, :test do
  gem 'webrick'
  gem 'rspec-rails'
  gem 'spork', '~> 1.0rc' # for its recent version.
end

group :test do
  # gem 'capybara'
  gem 'webrat'
  gem 'cucumber-rails', :require => false	# test group only -> OK
  gem 'database_cleaner'			# test group only -> OK
  gem 'email_spec'      			# test group only -> OK
  gem 'factory_girl_rails'			# test group only -> Not specified
  # gem 'launchy'		# launching a browser
  gem 'machinist'		# test group only -> OK
end

group :assets do
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'sass-rails'
  gem 'therubyracer'
  gem 'uglifier'
end

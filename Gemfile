# ------------------------------------------------------------------------
# See: https://gist.github.com/1191428

require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
case HOST_OS
when /darwin/i
  gem 'rb-fsevent',	:group => :development
  gem 'growl',		:group => :development
when /linux/i
  gem 'libnotify',	:group => :development
  gem 'rb-inotify',	:group => :development
when /mswin|windows|mingw32/i
  gem 'rb-fchange',	:group => :development
  gem 'win32console',	:group => :development
  gem 'rb-notifu',	:group => :development
  gem 'eventmachine', '>= 1.0.0.beta', :group => :development
end

# group :production, :development do
# end

group :development, :test do
  gem 'capistrano'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-migrate'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'launchy'			# lounches a browser.
  gem 'rails3-generators'	# for factory_girl_rails and simple_form
  gem 'rubygems-bundler'
  gem 'spork'
  gem 'thin'
end

# for Livereload
group :development do
  gem 'guard-livereload'
  gem 'rack-livereload'
end

group :development do
  # pry
  gem 'pry-rails'
  # yard (documentation)
  gem 'yard'
  gem 'redcarpet'
  gem 'github-markup'
end

group :test do
  gem 'rspec'
  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-instafail'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'cucumber'
  gem 'cucumber-rails', :require => false 
end

# Using Zurui
# https://github.com/mahm/zurui-sass-rails
group :assets do
  gem 'sass-rails'
  gem 'compass-rails'
  gem 'zurui-sass-rails'
end

group :assets do
  gem 'coffee-rails'
  gem 'therubyracer'
  gem 'uglifier'
end

gem 'active_scaffold', :git => 'git://github.com/activescaffold/active_scaffold.git'
gem 'bootstrap-sass'
gem 'colorize'		# colorful logs
gem 'devise'
gem 'foreigner'
gem 'haml-rails'
gem 'jquery-rails'
gem 'log4r'
gem 'rails'
gem 'simple_form'
gem 'sqlite3'
gem 'uuidtools'
gem 'rb-readline'

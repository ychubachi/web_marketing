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

# ------------------------------------------------------------------------
group :development do
  gem 'thin' # Web app server
  gem 'capistrano'	# Deploy
  # for Guard
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-migrate'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'
  # for Livereload
  gem 'guard-livereload'
  gem 'rack-livereload'
  # pry
  gem 'pry-rails'
  # yard (documentation)
  gem 'yard'
  gem 'redcarpet'
  gem 'github-markup'
end

group :test do
  gem 'rake'			# for Travis CI
  gem 'rspec'
  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-instafail'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'cucumber'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'			# lounches a browser for capybara.
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'foreigner'
end

group :assets do
  # Stylesheets
  gem 'sass-rails'
  gem 'bootstrap-sass'
  gem 'compass-rails'
  gem 'zurui-sass-rails' # https://github.com/mahm/zurui-sass-rails
  # Javascripts
  gem 'coffee-rails'
  gem 'uglifier' # JavaScript compressor
  gem 'therubyracer', '0.11.1'
  gem 'libv8', '~> 3.11.8.13' # http://d.hatena.ne.jp/suu-g/20121222/1356189597
end

gem 'active_scaffold', :git => 'git://github.com/activescaffold/active_scaffold.git'
gem 'devise'
gem 'simple_form'

gem 'colorize'		# colorful logs
gem 'haml-rails'
gem 'jquery-rails'
gem 'log4r'
gem 'rails'
gem 'sqlite3'
gem 'uuidtools'
gem 'rb-readline'
gem 'rails3-generators'	# for factory_girl_rails and simple_form
gem 'rubygems-bundler'

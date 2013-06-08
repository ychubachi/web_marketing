# ------------------------------------------------------------------------
# See: https://gist.github.com/1191428

require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify'
  when /mswin|windows|mingw32/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
    gem 'eventmachine', '>= 1.0.0.beta', :group => :development
end

group :development, :test do
  gem 'capistrano'
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-livereload'
  gem 'guard-migrate'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'launchy'			# lounches a browser.
  gem 'rails3-generators'	# for factory_girl_rails and simple_form
  gem 'rspec',              :git => 'git://github.com/rspec/rspec.git'
  gem 'rspec-core',         :git => 'git://github.com/rspec/rspec-core.git'
  gem 'rspec-expectations', :git => 'git://github.com/rspec/rspec-expectations.git'
  gem 'rspec-instafail'
  gem 'rspec-mocks',        :git => 'git://github.com/rspec/rspec-mocks.git'
  gem 'rspec-rails',        :git => 'git://github.com/rspec/rspec-rails.git'
  gem 'rubygems-bundler'
  gem 'spork', '~> 1.0rc'	# for its recent version.
  gem 'thin'
  gem 'yard'
  gem 'redcarpet'
  gem 'github-markup'
end

group :development do
  gem 'pry-rails'
end

group :assets do
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'sass-rails'
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

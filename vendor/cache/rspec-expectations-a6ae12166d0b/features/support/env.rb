require 'aruba/cucumber'

timeouts = { 'java' => 60 }

Before do
  @aruba_timeout_seconds = timeouts.fetch(RUBY_PLATFORM) { 15 }
end

Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}") # disable JIT since these processes are so short lived
  end
end if RUBY_PLATFORM == 'java'

begin
  require 'coveralls'
  Coveralls.wear_merged! do
    add_filter '/bundle/'
  end
rescue Exception => e
  warn "Coveralls disabled"
end
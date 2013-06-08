# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-mocks"
  s.version = "2.14.0.rc1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Baker", "David Chelimsky"]
  s.date = "2013-06-08"
  s.description = "RSpec's 'test double' framework, with support for stubbing and mocking"
  s.email = "rspec-users@rubyforge.org"
  s.files = ["lib/rspec/mocks.rb", "lib/rspec/mocks/any_instance/chain.rb", "lib/rspec/mocks/any_instance/expectation_chain.rb", "lib/rspec/mocks/any_instance/message_chains.rb", "lib/rspec/mocks/any_instance/recorder.rb", "lib/rspec/mocks/any_instance/stub_chain.rb", "lib/rspec/mocks/any_instance/stub_chain_chain.rb", "lib/rspec/mocks/argument_list_matcher.rb", "lib/rspec/mocks/argument_matchers.rb", "lib/rspec/mocks/configuration.rb", "lib/rspec/mocks/deprecation.rb", "lib/rspec/mocks/error_generator.rb", "lib/rspec/mocks/errors.rb", "lib/rspec/mocks/example_methods.rb", "lib/rspec/mocks/extensions/instance_exec.rb", "lib/rspec/mocks/extensions/marshal.rb", "lib/rspec/mocks/framework.rb", "lib/rspec/mocks/instance_method_stasher.rb", "lib/rspec/mocks/matchers/have_received.rb", "lib/rspec/mocks/matchers/receive.rb", "lib/rspec/mocks/message_expectation.rb", "lib/rspec/mocks/method_double.rb", "lib/rspec/mocks/mock.rb", "lib/rspec/mocks/mutate_const.rb", "lib/rspec/mocks/order_group.rb", "lib/rspec/mocks/proxy.rb", "lib/rspec/mocks/proxy_for_nil.rb", "lib/rspec/mocks/space.rb", "lib/rspec/mocks/standalone.rb", "lib/rspec/mocks/stub_chain.rb", "lib/rspec/mocks/syntax.rb", "lib/rspec/mocks/targets.rb", "lib/rspec/mocks/test_double.rb", "lib/rspec/mocks/version.rb", "lib/spec/mocks.rb", "README.md", "License.txt", "Changelog.md", ".yardopts", ".document"]
  s.homepage = "http://github.com/rspec/rspec-mocks"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.0.2"
  s.summary = "rspec-mocks-2.14.0.rc1"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_development_dependency(%q<aruba>, ["~> 0.5"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_dependency(%q<aruba>, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
    s.add_dependency(%q<aruba>, ["~> 0.5"])
  end
end

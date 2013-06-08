# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-expectations"
  s.version = "2.14.0.rc1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Baker", "David Chelimsky"]
  s.date = "2013-06-08"
  s.description = "rspec expectations (should[_not] and matchers)"
  s.email = "rspec-users@rubyforge.org"
  s.files = ["lib/rspec-expectations.rb", "lib/rspec/expectations.rb", "lib/rspec/expectations/deprecation.rb", "lib/rspec/expectations/differ.rb", "lib/rspec/expectations/errors.rb", "lib/rspec/expectations/expectation_target.rb", "lib/rspec/expectations/extensions.rb", "lib/rspec/expectations/extensions/array.rb", "lib/rspec/expectations/extensions/object.rb", "lib/rspec/expectations/fail_with.rb", "lib/rspec/expectations/handler.rb", "lib/rspec/expectations/syntax.rb", "lib/rspec/expectations/version.rb", "lib/rspec/matchers.rb", "lib/rspec/matchers/be_close.rb", "lib/rspec/matchers/built_in.rb", "lib/rspec/matchers/built_in/base_matcher.rb", "lib/rspec/matchers/built_in/be.rb", "lib/rspec/matchers/built_in/be_instance_of.rb", "lib/rspec/matchers/built_in/be_kind_of.rb", "lib/rspec/matchers/built_in/be_within.rb", "lib/rspec/matchers/built_in/change.rb", "lib/rspec/matchers/built_in/cover.rb", "lib/rspec/matchers/built_in/eq.rb", "lib/rspec/matchers/built_in/eql.rb", "lib/rspec/matchers/built_in/equal.rb", "lib/rspec/matchers/built_in/exist.rb", "lib/rspec/matchers/built_in/has.rb", "lib/rspec/matchers/built_in/have.rb", "lib/rspec/matchers/built_in/include.rb", "lib/rspec/matchers/built_in/match.rb", "lib/rspec/matchers/built_in/match_array.rb", "lib/rspec/matchers/built_in/raise_error.rb", "lib/rspec/matchers/built_in/respond_to.rb", "lib/rspec/matchers/built_in/satisfy.rb", "lib/rspec/matchers/built_in/start_and_end_with.rb", "lib/rspec/matchers/built_in/throw_symbol.rb", "lib/rspec/matchers/built_in/yield.rb", "lib/rspec/matchers/compatibility.rb", "lib/rspec/matchers/configuration.rb", "lib/rspec/matchers/dsl.rb", "lib/rspec/matchers/extensions/instance_eval_with_args.rb", "lib/rspec/matchers/generated_descriptions.rb", "lib/rspec/matchers/matcher.rb", "lib/rspec/matchers/method_missing.rb", "lib/rspec/matchers/operator_matcher.rb", "lib/rspec/matchers/pretty.rb", "lib/rspec/matchers/test_unit_integration.rb", "README.md", "License.txt", "Changelog.md", ".yardopts", ".document"]
  s.homepage = "http://github.com/rspec/rspec-expectations"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.0.3"
  s.summary = "rspec-expectations-2.14.0.rc1"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<diff-lcs>, ["< 2.0", ">= 1.1.3"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_development_dependency(%q<aruba>, ["~> 0.5"])
    else
      s.add_dependency(%q<diff-lcs>, ["< 2.0", ">= 1.1.3"])
      s.add_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_dependency(%q<aruba>, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<diff-lcs>, ["< 2.0", ">= 1.1.3"])
    s.add_dependency(%q<rake>, ["~> 10.0.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
    s.add_dependency(%q<aruba>, ["~> 0.5"])
  end
end

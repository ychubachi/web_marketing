# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-core"
  s.version = "2.14.0.rc1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Baker", "David Chelimsky", "Chad Humphries"]
  s.bindir = "exe"
  s.date = "2013-06-08"
  s.description = "BDD for Ruby. RSpec runner and example groups."
  s.email = "rspec-users@rubyforge.org"
  s.executables = ["autospec", "rspec"]
  s.files = ["lib/autotest/discover.rb", "lib/autotest/rspec2.rb", "lib/rspec/autorun.rb", "lib/rspec/core.rb", "lib/rspec/core/backtrace_cleaner.rb", "lib/rspec/core/backward_compatibility.rb", "lib/rspec/core/command_line.rb", "lib/rspec/core/configuration.rb", "lib/rspec/core/configuration_options.rb", "lib/rspec/core/deprecation.rb", "lib/rspec/core/drb_command_line.rb", "lib/rspec/core/drb_options.rb", "lib/rspec/core/dsl.rb", "lib/rspec/core/example.rb", "lib/rspec/core/example_group.rb", "lib/rspec/core/extensions/instance_eval_with_args.rb", "lib/rspec/core/extensions/kernel.rb", "lib/rspec/core/extensions/module_eval_with_args.rb", "lib/rspec/core/extensions/ordered.rb", "lib/rspec/core/filter_manager.rb", "lib/rspec/core/formatters.rb", "lib/rspec/core/formatters/base_formatter.rb", "lib/rspec/core/formatters/base_text_formatter.rb", "lib/rspec/core/formatters/deprecation_formatter.rb", "lib/rspec/core/formatters/documentation_formatter.rb", "lib/rspec/core/formatters/helpers.rb", "lib/rspec/core/formatters/html_formatter.rb", "lib/rspec/core/formatters/html_printer.rb", "lib/rspec/core/formatters/json_formatter.rb", "lib/rspec/core/formatters/progress_formatter.rb", "lib/rspec/core/formatters/snippet_extractor.rb", "lib/rspec/core/formatters/text_mate_formatter.rb", "lib/rspec/core/hooks.rb", "lib/rspec/core/memoized_helpers.rb", "lib/rspec/core/metadata.rb", "lib/rspec/core/metadata_hash_builder.rb", "lib/rspec/core/mocking/with_absolutely_nothing.rb", "lib/rspec/core/mocking/with_flexmock.rb", "lib/rspec/core/mocking/with_mocha.rb", "lib/rspec/core/mocking/with_rr.rb", "lib/rspec/core/mocking/with_rspec.rb", "lib/rspec/core/option_parser.rb", "lib/rspec/core/pending.rb", "lib/rspec/core/project_initializer.rb", "lib/rspec/core/rake_task.rb", "lib/rspec/core/reporter.rb", "lib/rspec/core/ruby_project.rb", "lib/rspec/core/runner.rb", "lib/rspec/core/shared_context.rb", "lib/rspec/core/shared_example_group.rb", "lib/rspec/core/shared_example_group/collection.rb", "lib/rspec/core/version.rb", "lib/rspec/core/world.rb", "README.md", "License.txt", "Changelog.md", ".yardopts", ".document", "exe/autospec", "exe/rspec"]
  s.homepage = "http://github.com/rspec/rspec-core"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.0.2"
  s.summary = "rspec-core-2.14.0.rc1"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_development_dependency(%q<aruba>, ["~> 0.5"])
      s.add_development_dependency(%q<ZenTest>, ["~> 4.6"])
      s.add_development_dependency(%q<nokogiri>, ["= 1.5.2"])
      s.add_development_dependency(%q<syntax>, ["= 1.0.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.13.0"])
      s.add_development_dependency(%q<rr>, ["~> 1.0.4"])
      s.add_development_dependency(%q<flexmock>, ["~> 0.9.0"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_dependency(%q<aruba>, ["~> 0.5"])
      s.add_dependency(%q<ZenTest>, ["~> 4.6"])
      s.add_dependency(%q<nokogiri>, ["= 1.5.2"])
      s.add_dependency(%q<syntax>, ["= 1.0.0"])
      s.add_dependency(%q<mocha>, ["~> 0.13.0"])
      s.add_dependency(%q<rr>, ["~> 1.0.4"])
      s.add_dependency(%q<flexmock>, ["~> 0.9.0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
    s.add_dependency(%q<aruba>, ["~> 0.5"])
    s.add_dependency(%q<ZenTest>, ["~> 4.6"])
    s.add_dependency(%q<nokogiri>, ["= 1.5.2"])
    s.add_dependency(%q<syntax>, ["= 1.0.0"])
    s.add_dependency(%q<mocha>, ["~> 0.13.0"])
    s.add_dependency(%q<rr>, ["~> 1.0.4"])
    s.add_dependency(%q<flexmock>, ["~> 0.9.0"])
  end
end

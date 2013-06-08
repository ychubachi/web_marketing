# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-rails"
  s.version = "2.14.0.rc1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Chelimsky"]
  s.date = "2013-06-08"
  s.description = "RSpec for Rails"
  s.email = "rspec-users@rubyforge.org"
  s.files = ["lib/autotest/rails_rspec2.rb", "lib/generators/rspec.rb", "lib/generators/rspec/controller/controller_generator.rb", "lib/generators/rspec/controller/templates/controller_spec.rb", "lib/generators/rspec/controller/templates/view_spec.rb", "lib/generators/rspec/helper/helper_generator.rb", "lib/generators/rspec/helper/templates/helper_spec.rb", "lib/generators/rspec/install/install_generator.rb", "lib/generators/rspec/install/templates/.rspec", "lib/generators/rspec/install/templates/spec/spec_helper.rb.tt", "lib/generators/rspec/integration/integration_generator.rb", "lib/generators/rspec/integration/templates/request_spec.rb", "lib/generators/rspec/mailer/mailer_generator.rb", "lib/generators/rspec/mailer/templates/fixture", "lib/generators/rspec/mailer/templates/mailer_spec.rb", "lib/generators/rspec/model/model_generator.rb", "lib/generators/rspec/model/templates/fixtures.yml", "lib/generators/rspec/model/templates/model_spec.rb", "lib/generators/rspec/observer/observer_generator.rb", "lib/generators/rspec/observer/templates/observer_spec.rb", "lib/generators/rspec/scaffold/scaffold_generator.rb", "lib/generators/rspec/scaffold/templates/controller_spec.rb", "lib/generators/rspec/scaffold/templates/edit_spec.rb", "lib/generators/rspec/scaffold/templates/index_spec.rb", "lib/generators/rspec/scaffold/templates/new_spec.rb", "lib/generators/rspec/scaffold/templates/routing_spec.rb", "lib/generators/rspec/scaffold/templates/show_spec.rb", "lib/generators/rspec/view/templates/view_spec.rb", "lib/generators/rspec/view/view_generator.rb", "lib/rspec-rails.rb", "lib/rspec/rails.rb", "lib/rspec/rails/adapters.rb", "lib/rspec/rails/example.rb", "lib/rspec/rails/example/controller_example_group.rb", "lib/rspec/rails/example/feature_example_group.rb", "lib/rspec/rails/example/helper_example_group.rb", "lib/rspec/rails/example/mailer_example_group.rb", "lib/rspec/rails/example/model_example_group.rb", "lib/rspec/rails/example/rails_example_group.rb", "lib/rspec/rails/example/request_example_group.rb", "lib/rspec/rails/example/routing_example_group.rb", "lib/rspec/rails/example/view_example_group.rb", "lib/rspec/rails/extensions.rb", "lib/rspec/rails/extensions/active_record/base.rb", "lib/rspec/rails/extensions/active_record/proxy.rb", "lib/rspec/rails/fixture_support.rb", "lib/rspec/rails/matchers.rb", "lib/rspec/rails/matchers/be_a_new.rb", "lib/rspec/rails/matchers/be_new_record.rb", "lib/rspec/rails/matchers/be_valid.rb", "lib/rspec/rails/matchers/have_extension.rb", "lib/rspec/rails/matchers/have_rendered.rb", "lib/rspec/rails/matchers/redirect_to.rb", "lib/rspec/rails/matchers/relation_match_array.rb", "lib/rspec/rails/matchers/routing_matchers.rb", "lib/rspec/rails/mocks.rb", "lib/rspec/rails/module_inclusion.rb", "lib/rspec/rails/tasks/rspec.rake", "lib/rspec/rails/vendor/capybara.rb", "lib/rspec/rails/vendor/webrat.rb", "lib/rspec/rails/version.rb", "lib/rspec/rails/view_assigns.rb", "lib/rspec/rails/view_rendering.rb", "README.md", "License.txt", "Changelog.md", "Capybara.md", ".yardopts", ".document"]
  s.homepage = "http://github.com/rspec/rspec-rails"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.0.2"
  s.summary = "rspec-rails-2.14.0.rc1"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0"])
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_runtime_dependency(%q<rspec-core>, ["= 2.14.0.rc1"])
      s.add_runtime_dependency(%q<rspec-expectations>, ["= 2.14.0.rc1"])
      s.add_runtime_dependency(%q<rspec-mocks>, ["= 2.14.0.rc1"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_development_dependency(%q<aruba>, ["~> 0.4.11"])
      s.add_development_dependency(%q<ZenTest>, ["= 4.9.0"])
      s.add_development_dependency(%q<ammeter>, ["= 0.2.5"])
      s.add_development_dependency(%q<capybara>, [">= 2.0.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0"])
      s.add_dependency(%q<actionpack>, [">= 3.0"])
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<rspec-core>, ["= 2.14.0.rc1"])
      s.add_dependency(%q<rspec-expectations>, ["= 2.14.0.rc1"])
      s.add_dependency(%q<rspec-mocks>, ["= 2.14.0.rc1"])
      s.add_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_dependency(%q<aruba>, ["~> 0.4.11"])
      s.add_dependency(%q<ZenTest>, ["= 4.9.0"])
      s.add_dependency(%q<ammeter>, ["= 0.2.5"])
      s.add_dependency(%q<capybara>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0"])
    s.add_dependency(%q<actionpack>, [">= 3.0"])
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<rspec-core>, ["= 2.14.0.rc1"])
    s.add_dependency(%q<rspec-expectations>, ["= 2.14.0.rc1"])
    s.add_dependency(%q<rspec-mocks>, ["= 2.14.0.rc1"])
    s.add_dependency(%q<rake>, ["~> 10.0.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
    s.add_dependency(%q<aruba>, ["~> 0.4.11"])
    s.add_dependency(%q<ZenTest>, ["= 4.9.0"])
    s.add_dependency(%q<ammeter>, ["= 0.2.5"])
    s.add_dependency(%q<capybara>, [">= 2.0.0"])
  end
end

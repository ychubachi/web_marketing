# config/initializers/active_scaffold.rb
ActiveScaffold.set_defaults do |config| 
  config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  config.action_links.add 'index', controller: 'referrers', label: 'Referrers', page: true
  config.action_links.add 'index', controller: 'users', label: 'Users', page: true
  config.action_links.add 'index', controller: 'redirects', label: 'Redirects', page: true
  config.action_links.add 'index', controller: 'targets', label: 'Targets', page: true
  config.action_links.add 'index', controller: 'media', label: 'Media', page: true
end

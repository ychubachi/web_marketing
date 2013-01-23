# config/initializers/active_scaffold.rb
ActiveScaffold.set_defaults do |config| 
  config.action_links.add 'index', controller: 'conversions', label: 'CVs', page: true
  config.action_links.add 'index', controller: 'page_views', label: 'PVs', page: true
  config.action_links.add 'index', controller: 'redirections', label: '*RDs', page: true
  config.action_links.add 'index', controller: 'targets', label: '*Targets', page: true
  config.action_links.add 'index', controller: 'media', label: '*Media', page: true
  config.action_links.add 'index', controller: 'actions', label: 'Actions', page: true
  config.action_links.add 'index', controller: 'requests', label: 'Requests', page: true
  config.action_links.add 'index', controller: 'browsers', label: 'Browsers', page: true
  config.action_links.add 'index', controller: 'customers', label: 'Customers', page: true
end

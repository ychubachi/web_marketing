require "bundler/capistrano"

set :application, "web_marketing"
set :repository,  "git@github.com:ychubachi/web_marketing.git"
set :scm, :git
set :deploy_to, "/home/rails/web_marketing"
set :use_sudo, false

role :web, "pr.aiit.ac.jp"
role :app, "pr.aiit.ac.jp"
role :db,  "pr.aiit.ac.jp", :primary => true

If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

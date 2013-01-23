require "bundler/capistrano"

set :application, "web_marketing"
set :repository,  "git@github.com:ychubachi/web_marketing.git"
set :scm, :git
set :deploy_to, "/home/rails/web_marketing"
set :use_sudo, false

role :web, "pr.aiit.ac.jp"
role :app, "pr.aiit.ac.jp"
role :db,  "pr.aiit.ac.jp", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    t=Time.now
    run "cp /home/rails/web_marketing/shared/db/production.sqlite3 /home/rails/web_marketing/backup/#{t.year}-#{t.month}-#{t.day}_#{t.hour}:#{t.min}:#{t.sec}_production.sqlite3"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

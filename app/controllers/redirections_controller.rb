class RedirectionsController < ApplicationController
  active_scaffold :redirection do |conf|
    conf.list.columns.add :title
  end
end 

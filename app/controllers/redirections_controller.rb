class RedirectionsController < ApplicationController
  active_scaffold :redirect do |conf|
    conf.list.columns.add :title
  end
end 

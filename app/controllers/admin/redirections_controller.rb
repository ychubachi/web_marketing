class Admin::RedirectionsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :redirection do |conf|
    conf.list.columns.add :title
    list.sorting = {:code => 'ASC'}
  end
end 

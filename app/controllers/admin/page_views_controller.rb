class Admin::PageViewsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :page_view do |conf|
  end
end 

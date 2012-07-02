class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :page do |conf|
  end
end 

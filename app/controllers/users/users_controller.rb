=begin
To create a new user

# rails c

User.create! do |u|
  u.email = 'user@example.com'
  u.password = 'please'
  u.password_confirmation = 'please'
end

=end

class Users::UsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin/application'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end

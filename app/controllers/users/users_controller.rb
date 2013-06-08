# -*- coding: utf-8 -*-
#
# Userを取り扱います．新規にUserを追加する方法はREADME.mdを参照のこと．
#
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

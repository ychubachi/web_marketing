# -*- coding: utf-8 -*-

# 2013-01-23
# - このファイルを変更しても，自動的にリロードされません．
# - Guardfileでこのファイルをwatchするようにしました．
# 2013-01-28
# - テストをしやすくするため，ロジックをUtilityモジュールに移動しました．

class ApplicationController < ActionController::Base
  protect_from_forgery

  # サイン・アウト後，ログイン画面に遷移するようにします．
  # これを記述しないと，root_pathに遷移してしまいます．
  def after_sign_out_path_for resource
    new_user_session_path
  end 

end

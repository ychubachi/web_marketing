class FixDefaultRedirectToRedirect < ActiveRecord::Migration
  def up
    rename_column :redirects, :default_redirect, :is_default
  end

  def down
    rename_column :redirects, :is_default, :default_redirect
  end
end

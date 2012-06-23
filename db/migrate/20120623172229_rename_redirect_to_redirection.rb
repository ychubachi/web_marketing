class RenameRedirectToRedirection < ActiveRecord::Migration
  def up
    rename_table :redirects, :redirections
  end

  def down
    rename_table :redirections, :redirects
  end
end

class RenameRedirectIdToRedirectionIdToAction < ActiveRecord::Migration
  def up
    rename_column :actions, :redirect_id, :redirection_id
  end

  def down
    rename_column :actions, :redirection_id, :redirect_id
  end
end

class RemovePageIdAndRedirectIdFromAction < ActiveRecord::Migration
  def up
    remove_column :actions, :page_id
    remove_column :actions, :redirection_id
  end

  def down
    add_column :actions, :redirection_id, :integer
    add_column :actions, :page_id, :integer
  end
end

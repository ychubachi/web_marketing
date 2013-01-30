class RemoveBrowserIdFromForm < ActiveRecord::Migration
  def up
    remove_column :forms, :browser_id
  end

  def down
    add_column :forms, :browser_id, :integer
  end
end

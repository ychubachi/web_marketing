class AddBrowserIdToForm < ActiveRecord::Migration
  def change
    add_column :forms, :browser_id, :integer
  end
end

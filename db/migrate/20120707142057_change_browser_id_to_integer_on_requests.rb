class ChangeBrowserIdToIntegerOnRequests < ActiveRecord::Migration
  def up
    change_column :requests, :browser_id, :integer
  end

  def down
    change_column :requests, :browser_id, :string
  end
end

class AddBrowserToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :browser_id, :string
  end
end

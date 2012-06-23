class AddIsAdminToBrowser < ActiveRecord::Migration
  def change
    add_column :browsers, :is_admin, :boolean
  end
end

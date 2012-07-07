class RemoveStringFromCustomer < ActiveRecord::Migration
  def up
    remove_column :customers, :string
  end

  def down
    add_column :customers, :string, :string
  end
end

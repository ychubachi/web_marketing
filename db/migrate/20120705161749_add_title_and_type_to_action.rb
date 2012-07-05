class AddTitleAndTypeToAction < ActiveRecord::Migration
  def change
    add_column :actions, :type, :string
    add_column :actions, :title, :string
  end
end

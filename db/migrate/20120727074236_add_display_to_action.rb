class AddDisplayToAction < ActiveRecord::Migration
  def change
    add_column :actions, :display, :string
  end
end

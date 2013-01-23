class RemoveDisplayFromActions < ActiveRecord::Migration
  def up
    remove_column :actions, :display
  end

  def down
    add_column :actions, :display, :string
  end
end

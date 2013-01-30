class RemoveForm < ActiveRecord::Migration
  def up
    drop_table :forms
  end

  def down
  end
end

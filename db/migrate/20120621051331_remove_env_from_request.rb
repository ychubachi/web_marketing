class RemoveEnvFromRequest < ActiveRecord::Migration
  def up
    remove_column :requests, :env
  end

  def down
    add_column :requests, :env, :string
  end
end

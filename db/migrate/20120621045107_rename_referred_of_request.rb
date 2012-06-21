class RenameReferredOfRequest < ActiveRecord::Migration
  def up
    rename_column :requests, :referred, :referrer
  end

  def down
    rename_column :requests, :referrer, :referred
  end
end

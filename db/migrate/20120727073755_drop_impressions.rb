class DropImpressions < ActiveRecord::Migration
  def up
    drop_table :impressions
  end

  def down
  end
end

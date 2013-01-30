class RemoveInquiry < ActiveRecord::Migration
  def up
    drop_table :inquiries
  end

  def down
  end
end

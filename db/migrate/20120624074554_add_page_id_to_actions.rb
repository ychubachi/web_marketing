class AddPageIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :page_id, :integer
  end
end

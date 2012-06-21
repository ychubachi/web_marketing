class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :referred
      t.string :env
      t.integer :action_id

      t.timestamps
    end
  end
end

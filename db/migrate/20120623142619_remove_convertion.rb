class RemoveConvertion < ActiveRecord::Migration
  def up
    drop_table :convertions
  end

  def down
    create_table :convertions do |t|
      t.string :title

      t.timestamps
    end
  end
end

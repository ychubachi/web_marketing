class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :redirect_id
      t.integer :convertion_id

      t.timestamps
    end
  end
end

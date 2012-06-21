class CreateConvertions < ActiveRecord::Migration
  def change
    create_table :convertions do |t|
      t.string :title

      t.timestamps
    end
  end
end

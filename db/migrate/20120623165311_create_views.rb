class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :title

      t.timestamps
    end
  end
end

class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.string :title

      t.timestamps
    end
  end
end

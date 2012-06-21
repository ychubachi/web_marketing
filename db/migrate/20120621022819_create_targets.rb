class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end

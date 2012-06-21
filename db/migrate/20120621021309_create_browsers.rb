class CreateBrowsers < ActiveRecord::Migration
  def change
    create_table :browsers do |t|
      t.string :uuid
      t.string :user_agent

      t.timestamps
    end
  end
end

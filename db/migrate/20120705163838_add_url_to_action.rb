class AddUrlToAction < ActiveRecord::Migration
  def change
    add_column :actions, :url, :string
  end
end

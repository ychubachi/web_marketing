class AddUrlToPage < ActiveRecord::Migration
  def change
    add_column :pages, :url, :string
  end
end

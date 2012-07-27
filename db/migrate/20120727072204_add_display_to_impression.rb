class AddDisplayToImpression < ActiveRecord::Migration
  def change
    add_column :impressions, :display, :string
  end
end

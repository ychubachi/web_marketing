class AddCodeAndIsDefaultAndMediumAndTargetToAction < ActiveRecord::Migration
  def change
    add_column :actions, :code, :string
    add_column :actions, :is_default, :boolean
    add_column :actions, :medium_id, :integer
    add_column :actions, :target_id, :integer
  end
end

class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "actions", "media", :name => "actions_medium_id_fk"
    add_foreign_key "actions", "targets", :name => "actions_target_id_fk"
    add_foreign_key "customers", "browsers", :name => "customers_browser_id_fk"
    add_foreign_key "requests", "actions", :name => "requests_action_id_fk"
    add_foreign_key "requests", "browsers", :name => "requests_browser_id_fk"
  end
end

class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :address
      t.integer :browser_id
      t.string :inquiry
      t.string :email
      t.string :family_name
      t.string :given_name
      t.string :postal_code

      t.timestamps
    end
  end
end

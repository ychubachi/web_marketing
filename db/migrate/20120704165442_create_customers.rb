class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :family_name
      t.string :given_name
      t.string :email
      t.string :postal_code
      t.string :address
      t.string :string
      t.string :comment
      t.integer :browser_id

      t.timestamps
    end
  end
end

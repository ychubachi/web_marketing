class AddCustomerIdToForm < ActiveRecord::Migration
  def change
    add_column :forms, :customer_id, :integer
  end
end

class AddCustomerIdToBrowser < ActiveRecord::Migration
  def change
    add_column :browsers, :customer_id, :integer
  end
end
